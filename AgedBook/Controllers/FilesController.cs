using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace AgedBook.Controllers
{
    public class FilesController : Controller
    {
        // GET: Files
        
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Index(HttpPostedFileBase file) 
        {
            try 
            {

            if (file.ContentLength > 0) 
            {
                    string filename = Path.GetFileName(file.FileName);
                    string filepath = Path.Combine(Server.MapPath("~/Uploaded"), filename);
                    file.SaveAs(filepath);
                }
                return RedirectToAction("Index");
                ViewBag.Message = "Uploaded successfully.";
            }
            catch
            {
                ViewBag.Message = "Not saved.";
                return View();
            }
        }
    }
}