using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AgedBook.Models;
using System.IO;


namespace AgedBook.Controllers
{
    public class PublishesController : Controller
    {
        private MyDataBaseEntities db = new MyDataBaseEntities();

        // GET: Publishes
        [Authorize]
        public ActionResult Index()
        {

            var publishes = db.Publishes.Include(p => p.Category).Include(p => p.City).Include(p => p.User);
            return View(publishes.ToList());
        }

        // GET: Publishes/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Publish publish = db.Publishes.Find(id);
            if (publish == null)
            {
                return HttpNotFound();
            }
            return View(publish);
        }
        [Authorize]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Publish publish = db.Publishes.Find(id);
            if (publish == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", publish.CategoryID);
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", publish.CityID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "FirstName", publish.UserID);
            return View(publish);
        }

        // POST: Publishes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PublishID,UserID,CityID,ActivePublish,Description,ImageUrl,CategoryID,ItemName")] Publish publish)
        {
            if (ModelState.IsValid)
            {
                User user = db.Users.Single(u => u.EmailID == User.Identity.Name);
                publish.User = user;
                db.Publishes.Add(publish);
                db.Entry(publish).State = EntityState.Modified;
                db.SaveChanges();
                ModelState.Clear();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", publish.CategoryID);
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", publish.CityID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "FirstName", publish.UserID);
            return View(publish);
        }


        // GET: Publishes/Create
        [Authorize]
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName");
            ViewBag.UserID = new SelectList(db.Users, "UserID", "FirstName");
            return View();
        }



        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( HttpPostedFileBase file,Publish publish)
        {
            string message = "";
            #pragma warning disable CS0219
            bool status = false;
            #pragma warning restore CS0219
            if (ModelState.IsValid)
            {

                User user = db.Users.Single(u => u.EmailID == User.Identity.Name);
                publish.User = user;
                db.Publishes.Add(publish);
                db.SaveChanges();
                message = "Book has been published successfully.";
                status = true;
                ModelState.Clear();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", publish.CategoryID);
            ViewBag.CityID = new SelectList(db.Cities, "CityID", "CityName", publish.CityID);
            ViewBag.UserID = new SelectList(db.Users, "UserID", "EmailID", publish.UserID);
            return View();
        }

        // GET: Publishes/Delete/5
        [Authorize]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Publish publish = db.Publishes.Find(id);
            if (publish == null)
            {
                return HttpNotFound();
            }
            return View(publish);
        }

        // POST: Publishes/Delete/5
        [Authorize]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Publish publish = db.Publishes.Find(id);
            db.Publishes.Remove(publish);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        [HttpGet]
        [Authorize]
        public ActionResult Category(int? id)
        {
            using (MyDataBaseEntities db = new MyDataBaseEntities())
            {            
                var publishes = db.Publishes.Include(p => p.Category).Include(p => p.City).Include(p => p.User).Where(p => p.CategoryID == id);
                return View(publishes.ToList());

            }
        }
    }
}
