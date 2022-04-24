using proje.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace proje.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {

        ProjeEntities db = new ProjeEntities();

        // GET: Home
        //[Authorize]
        public ActionResult Index()
        {
            var model = db.Urun_tbl.ToList();
            return View(model);
        }

        //[Authorize]
        [HttpGet]
        public ActionResult Yeni()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Yeni(Urun_tbl p1)
        {
            if (p1.UrunID == 0)
            {
                db.Urun_tbl.Add(p1);
            }
            else 
            {
                var guncellenecekdepartman = db.Urun_tbl.Find(p1.UrunID);

                if (guncellenecekdepartman == null)
                {
                    return HttpNotFound();
                }

                guncellenecekdepartman.urun_adi = p1.urun_adi;
                guncellenecekdepartman.urun_aciklama = p1.urun_aciklama;
                guncellenecekdepartman.urun_fiyat = p1.urun_fiyat;
                guncellenecekdepartman.stok = p1.stok;
            }

            db.SaveChanges();

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Sil(int id)
        {
            var silinicekdepartman = db.Urun_tbl.Find(id);

            if (silinicekdepartman == null)
            {
                return HttpNotFound();
            }

            db.Urun_tbl.Remove(silinicekdepartman);
            db.SaveChanges();

            return RedirectToAction("Index");
        }


        public ActionResult Guncelle(int id)
        {
            var model = db.Urun_tbl.Find(id);

            if (model == null)
            {
                return HttpNotFound();

            }

            return View("Yeni", model);
        }



    }
}