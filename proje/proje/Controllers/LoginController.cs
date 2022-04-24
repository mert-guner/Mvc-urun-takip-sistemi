using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using proje.Models;
using System.Web.Security;

namespace proje.Controllers
{
    public class LoginController : Controller
    {
        ProjeEntities db = new ProjeEntities();

        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {          

            return View();
        }

        [HttpPost]
        public ActionResult Index(login_tbl login)
        {
            var bilgiler = db.login_tbl.FirstOrDefault(x => x.kullanici_adi == login.kullanici_adi && x.sifre == login.sifre);

            if (bilgiler != null)
            {
                FormsAuthentication.SetAuthCookie(bilgiler.kullanici_adi, false);
                Session["kullanici_adi"] = bilgiler.kullanici_adi;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                
                return View();
            }
            
        }

        public ActionResult Uye()
        {

            return View();
        }

        [HttpPost]
        public ActionResult Uye(login_tbl kayit)
        {
            db.login_tbl.Add(kayit);
            db.SaveChanges();
            return RedirectToAction("Index", "Login");
        }


        public ActionResult Cikis()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Login");
        }

    }
}