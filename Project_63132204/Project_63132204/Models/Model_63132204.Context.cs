﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project_63132204.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Project_63132204Entities : DbContext
    {
        public Project_63132204Entities()
            : base("name=Project_63132204Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<DichVu> DichVus { get; set; }
        public virtual DbSet<HoaDonDatPhong> HoaDonDatPhongs { get; set; }
        public virtual DbSet<HoaDonDichVu> HoaDonDichVus { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<LoaiDichVu> LoaiDichVus { get; set; }
        public virtual DbSet<LoaiPhong> LoaiPhongs { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<Phong> Phongs { get; set; }
    
        public virtual int KhachHang_TimKiem(string hoTenKH, string gioiTinh)
        {
            var hoTenKHParameter = hoTenKH != null ?
                new ObjectParameter("HoTenKH", hoTenKH) :
                new ObjectParameter("HoTenKH", typeof(string));
    
            var gioiTinhParameter = gioiTinh != null ?
                new ObjectParameter("GioiTinh", gioiTinh) :
                new ObjectParameter("GioiTinh", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("KhachHang_TimKiem", hoTenKHParameter, gioiTinhParameter);
        }
    
        public virtual int NhanVien_TimKiem(string hoTen, string gioiTinh)
        {
            var hoTenParameter = hoTen != null ?
                new ObjectParameter("HoTen", hoTen) :
                new ObjectParameter("HoTen", typeof(string));
    
            var gioiTinhParameter = gioiTinh != null ?
                new ObjectParameter("GioiTinh", gioiTinh) :
                new ObjectParameter("GioiTinh", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("NhanVien_TimKiem", hoTenParameter, gioiTinhParameter);
        }
    
        public virtual ObjectResult<ThongKe_Dichvu_Result> ThongKe_Dichvu(Nullable<System.DateTime> ngayDau, Nullable<System.DateTime> ngayCuoi)
        {
            var ngayDauParameter = ngayDau.HasValue ?
                new ObjectParameter("NgayDau", ngayDau) :
                new ObjectParameter("NgayDau", typeof(System.DateTime));
    
            var ngayCuoiParameter = ngayCuoi.HasValue ?
                new ObjectParameter("NgayCuoi", ngayCuoi) :
                new ObjectParameter("NgayCuoi", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ThongKe_Dichvu_Result>("ThongKe_Dichvu", ngayDauParameter, ngayCuoiParameter);
        }
    
        public virtual ObjectResult<ThongKe_HoaDon_Result> ThongKe_HoaDon(Nullable<System.DateTime> ngayDau, Nullable<System.DateTime> ngayCuoi)
        {
            var ngayDauParameter = ngayDau.HasValue ?
                new ObjectParameter("NgayDau", ngayDau) :
                new ObjectParameter("NgayDau", typeof(System.DateTime));
    
            var ngayCuoiParameter = ngayCuoi.HasValue ?
                new ObjectParameter("NgayCuoi", ngayCuoi) :
                new ObjectParameter("NgayCuoi", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ThongKe_HoaDon_Result>("ThongKe_HoaDon", ngayDauParameter, ngayCuoiParameter);
        }
    }
}
