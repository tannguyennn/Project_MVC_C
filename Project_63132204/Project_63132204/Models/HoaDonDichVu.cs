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
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class HoaDonDichVu
    {
        [DisplayName("Mã HDDV")]
        [Required(ErrorMessage = "Chưa nhập mã hóa đơn dịch vụ")]
        [StringLength(10)]
        public string MaHDDV { get; set; }

        [DisplayName("Mã phòng")]
        [Required(ErrorMessage = "Chưa nhập mã phòng")]
        [StringLength(10)]
        public string MaPhong { get; set; }

        [DisplayName("Mã NV")]
        [Required(ErrorMessage = "Chưa nhập mã nhân viên")]
        [StringLength(10)]
        public string MaNV { get; set; }

        [DisplayName("Mã số KH")]
        [Required(ErrorMessage = "Chưa nhập mã KH")]
        [StringLength(10)]
        public string MaKH { get; set; }

        [DisplayName("Mã Dv")]
        [Required(ErrorMessage = "Chưa nhập mã dịch vụ")]
        [StringLength(10)]
        public string MaDV { get; set; }

        [DisplayName("Ngày đặt")]
        [Required(ErrorMessage = "Chưa nhập ngày đặt")]
        public System.DateTime NgayDat { get; set; }

        [DisplayName("Số lượng")]
        [Required(ErrorMessage = "Chưa nhập số lượng")]
        public int SoLuong { get; set; }


        public virtual DichVu DichVu { get; set; }
        public virtual Phong Phong { get; set; }
        public virtual KhachHang KhachHang { get; set; }
        public virtual NhanVien NhanVien { get; set; }
    }
}