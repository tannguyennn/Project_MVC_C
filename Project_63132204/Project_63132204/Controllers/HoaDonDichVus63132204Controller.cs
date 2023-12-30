using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Project_63132204.Models;

namespace Project_63132204.Controllers
{
    public class HoaDonDichVus63132204Controller : Controller
    {
        private Project_63132204Entities db = new Project_63132204Entities();
        string makh()
        {
            String ma = Session["id"].ToString();
            return ma;
        }

        // GET: HoaDonDichVus63132204
        public ActionResult Index()
        {
            var hoaDonDichVus = db.HoaDonDichVus.Include(h => h.DichVu).Include(h => h.Phong).Include(h => h.KhachHang);
            return View(hoaDonDichVus.ToList());
        }

        // GET: HoaDonDichVus63132204/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonDichVu hoaDonDichVu = db.HoaDonDichVus.Find(id);
            if (hoaDonDichVu == null)
            {
                return HttpNotFound();
            }
            return View(hoaDonDichVu);
        }

        // GET: HoaDonDichVus63132204/Create
        public ActionResult Create()
        {
            ViewBag.MaDV = new SelectList(db.DichVus, "MaDV", "TenDV");
            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong");
            ViewBag.MaKH = new SelectList(db.KhachHangs, "MaKH", "MaKH");
            
            return View();
        }

        // POST: HoaDonDichVus63132204/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHDDV,MaPhong,MaNV,MaKH,MaDV,NgayDat,SoLuong")] HoaDonDichVu hoaDonDichVu)
        {
            if (ModelState.IsValid)
            {
                
                db.HoaDonDichVus.Add(hoaDonDichVu);
                db.SaveChanges();
                return RedirectToAction("Index", "DichVus63132204");
            }

            ViewBag.MaDV = new SelectList(db.DichVus, "MaDV", "TenDV", hoaDonDichVu.MaDV);
            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong", hoaDonDichVu.MaPhong);
            ViewBag.MaPhong = new SelectList(db.KhachHangs, "MaKH", "MaKH", hoaDonDichVu.MaKH);
            return View(hoaDonDichVu);
        }

        // GET: HoaDonDichVus63132204/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonDichVu hoaDonDichVu = db.HoaDonDichVus.Find(id);
            if (hoaDonDichVu == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDV = new SelectList(db.DichVus, "MaDV", "TenDV", hoaDonDichVu.MaDV);
            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong", hoaDonDichVu.MaPhong);
            return View(hoaDonDichVu);
        }

        // POST: HoaDonDichVus63132204/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHDDV,MaPhong,MaNV,MaKH,MaDV,NgayDat,SoLuong")] HoaDonDichVu hoaDonDichVu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoaDonDichVu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaDV = new SelectList(db.DichVus, "MaDV", "TenDV", hoaDonDichVu.MaDV);
            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong", hoaDonDichVu.MaPhong);
            return View(hoaDonDichVu);
        }

        // GET: HoaDonDichVus63132204/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonDichVu hoaDonDichVu = db.HoaDonDichVus.Find(id);
            if (hoaDonDichVu == null)
            {
                return HttpNotFound();
            }
            return View(hoaDonDichVu);
        }

        // POST: HoaDonDichVus63132204/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            HoaDonDichVu hoaDonDichVu = db.HoaDonDichVus.Find(id);
            db.HoaDonDichVus.Remove(hoaDonDichVu);
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
    }
}
