using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AgedBook.Models;
using System.Net.Mail;
using System.Net;
using System.Web.Security;
using System.Data.Entity.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.Data.Entity;

namespace AgedBook.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            if (ModelState.IsValid)
            {
                using (MyDataBaseEntities dc = new MyDataBaseEntities())
                {

                    var cat = dc.Categories.ToList();
                    return View(cat);


                }
            }
            else
            {
                return View();
            }
        }

    }
}