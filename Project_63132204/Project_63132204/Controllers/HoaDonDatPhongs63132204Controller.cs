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
    public class HoaDonDatPhongs63132204Controller : Controller
    {
        private Project_63132204Entities db = new Project_63132204Entities();
        string makh()
        {
            string ma = Session["id"].ToString();
            return ma;
        }

        // GET: HoaDonDatPhongs63132204
        public ActionResult Index()
        {
            var hoaDonDatPhongs = db.HoaDonDatPhongs.Include(h => h.Phong).Include(h => h.KhachHang);
            return View(hoaDonDatPhongs.ToList());
        }

        // GET: HoaDonDatPhongs63132204/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonDatPhong hoaDonDatPhong = db.HoaDonDatPhongs.Find(id);
            if (hoaDonDatPhong == null)
            {
                return HttpNotFound();
            }
            return View(hoaDonDatPhong);
        }

        // GET: HoaDonDatPhongs63132204/Create
        public ActionResult Create()
        {
            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong");
            ViewBag.MaKH = new SelectList(db.KhachHangs, "MaKH", "MaKH");
            
            return View();
        }

        // POST: HoaDonDatPhongs63132204/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaDatPhong,MaKH,MaPhong,NgayDat,NgayVao,NgayRa,ThanhToan")] HoaDonDatPhong hoaDonDatPhong)
        {
            if (ModelState.IsValid)
            {
                ViewBag.date = DateTime.Now;
                hoaDonDatPhong.ThanhToan = false;
                db.HoaDonDatPhongs.Add(hoaDonDatPhong);
                db.SaveChanges();
                return RedirectToAction("Index","Phongs63132204");
            }

            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong", hoaDonDatPhong.MaPhong);
            ViewBag.MaKH = new SelectList(db.KhachHangs, "MaKH", "MaKH", hoaDonDatPhong.MaKH);
            return View(hoaDonDatPhong);
        }

        // GET: HoaDonDatPhongs63132204/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonDatPhong hoaDonDatPhong = db.HoaDonDatPhongs.Find(id);
            if (hoaDonDatPhong == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong", hoaDonDatPhong.MaPhong);
            return View(hoaDonDatPhong);
        }

        // POST: HoaDonDatPhongs63132204/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaDatPhong,MaNV,MaKH,MaPhong,NgayDat,NgayVao,NgayRa,ThanhToan")] HoaDonDatPhong hoaDonDatPhong)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoaDonDatPhong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaPhong = new SelectList(db.Phongs, "MaPhong", "TenPhong", hoaDonDatPhong.MaPhong);
            return View(hoaDonDatPhong);
        }

        // GET: HoaDonDatPhongs63132204/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDonDatPhong hoaDonDatPhong = db.HoaDonDatPhongs.Find(id);
            if (hoaDonDatPhong == null)
            {
                return HttpNotFound();
            }
            return View(hoaDonDatPhong);
        }

        // POST: HoaDonDatPhongs63132204/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            HoaDonDatPhong hoaDonDatPhong = db.HoaDonDatPhongs.Find(id);
            db.HoaDonDatPhongs.Remove(hoaDonDatPhong);
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
