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
    public class LoaiDichVus63132204Controller : Controller
    {
        private Project_63132204Entities1 db = new Project_63132204Entities1();

        // GET: LoaiDichVus63132204
        public ActionResult Index()
        {
            return View(db.LoaiDichVus.ToList());
        }

        // GET: LoaiDichVus63132204/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDichVu loaiDichVu = db.LoaiDichVus.Find(id);
            if (loaiDichVu == null)
            {
                return HttpNotFound();
            }
            return View(loaiDichVu);
        }

        // GET: LoaiDichVus63132204/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LoaiDichVus63132204/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaLDV,TenLDV")] LoaiDichVu loaiDichVu)
        {
            if (ModelState.IsValid)
            {
                db.LoaiDichVus.Add(loaiDichVu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiDichVu);
        }

        // GET: LoaiDichVus63132204/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDichVu loaiDichVu = db.LoaiDichVus.Find(id);
            if (loaiDichVu == null)
            {
                return HttpNotFound();
            }
            return View(loaiDichVu);
        }

        // POST: LoaiDichVus63132204/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaLDV,TenLDV")] LoaiDichVu loaiDichVu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiDichVu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiDichVu);
        }

        // GET: LoaiDichVus63132204/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDichVu loaiDichVu = db.LoaiDichVus.Find(id);
            if (loaiDichVu == null)
            {
                return HttpNotFound();
            }
            return View(loaiDichVu);
        }

        // POST: LoaiDichVus63132204/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            LoaiDichVu loaiDichVu = db.LoaiDichVus.Find(id);
            db.LoaiDichVus.Remove(loaiDichVu);
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
