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
    public class HomeController : Controller
    {
        private Project_63132204Entities db = new Project_63132204Entities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult Login_63132204()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login_63132204(string taikhoan, string password)
        {

            var data = db.NhanViens.Where(s => s.TKNV.Equals(taikhoan) && s.MKNV.Equals(password));
            if (data.Count() > 0)
            {
                String ho = data.FirstOrDefault().HoNV;
                String ten = data.FirstOrDefault().TenNV;
                //add session
                Session["name"] = ho+" "+ten;
                Session["taikhoan"] = data.FirstOrDefault().TKNV;
                Session["id"] = data.FirstOrDefault().MaNV;
                return RedirectToAction("Index", "Admin/NhanViensAdmin63132204");
            }
            var data2 = db.KhachHangs.Where(s => s.TKKH.Equals(taikhoan) && s.MKKH.Equals(password));
            if (data2.Count() > 0)
            {
                //add session
                Session["name"] = data2.FirstOrDefault().HoKH +" "+ data2.FirstOrDefault().TenKH;
                Session["taikhoan"] = data2.FirstOrDefault().TKKH;
                Session["id"] = data2.FirstOrDefault().MaKH;
                Session["gioitinh"] = data2.FirstOrDefault().GioiTinh;
                Session["cccd"] = data2.FirstOrDefault().CCCD;
                Session["sdt"] = data2.FirstOrDefault().SDT;
                Session["email"] = data2.FirstOrDefault().Email;
                
                return RedirectToAction("Index", "Home");
            }
            ViewBag.error = "Tên đăng nhập hoặc mật khẩu không đúng";
            return View();
        }
        public ActionResult Register_63132204()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register_63132204(KhachHang _user)
        {
            if (ModelState.IsValid)
            {
                var check = db.KhachHangs.FirstOrDefault(s => s.TKKH == _user.TKKH);
                if (check == null)
                {
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.KhachHangs.Add(_user);
                    db.SaveChanges();
                    Session["TenKhachHang"] = _user.HoKH+" "+ _user.TenKH;
                    Session["Taikhoan"] = _user.TKKH;
                    Session["id"] = _user.MaKH;
                    ViewBag.SuccessMessage = "Đăng ký thành công!";
                    return RedirectToAction("Login", "Home");
                }
                else
                {
                    ViewBag.error = "Tài khoản đã tồn tại";
                    return View();
                }
            }
            return View();
        }
    }
}