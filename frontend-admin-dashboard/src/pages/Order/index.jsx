import React, { useState, useEffect } from 'react';
import pdfMake from "pdfmake/build/pdfmake";
import pdfFonts from "pdfmake/build/vfs_fonts";
import Logo from '../../../public/book-store1.png';

import DataTable from "../../components/DataTable";

function Order() {
  const [orders, setOrders] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');

  useEffect(() => {
    async function fetchOrders() {
      fetch("http://localhost:8080/api/donhang/getalldonhang")
        .then((response) => response.json())
        .then((data) => {
          console.log(data);
          setOrders(data);
        });
    }
    fetchOrders();
  }, []);

  const handleSearchChange = (e) => {
    setSearchQuery(e.target.value);
  };

  const filteredOrders = orders.filter(order =>
    order.tenNguoiNhan.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const orderHeaders = [
    {
      label: "ID",
      className: "relative w-12 px-6 sm:w-16 sm:px-8",
      render: (item) => item.id,
    },
    {
      label: "Ngày đặt",
      className: "px-3 py-4 text-left text-sm tracking-wide text-slate-900 whitespace-nowrap",
      render: (item) => new Date(item.ngayDat).toLocaleDateString(),
    },
    {
      label: "Tên người nhận",
      className: "px-3 py-4 text-left text-sm tracking-wide text-slate-900 whitespace-nowrap",
      render: (item) => item.tenNguoiNhan,
    },
    {
      label: "Số điện thoại",
      className: "px-3 py-4 text-left text-sm tracking-wide text-slate-900 whitespace-nowrap",
      render: (item) => item.soDienThoai,
    },
    {
      label: "Địa chỉ",
      className: "pl-3 pr-4 py-4 text-left text-sm tracking-wide text-slate-900",
      render: (item) => (
        <div className="whitespace-normal break-words">
          {item.diaChi}
        </div>
      ),
    },
    {
      label: "Tổng tiền",
      className: "px-3 py-4 text-left text-sm tracking-wide text-slate-900 whitespace-nowrap",
      render: (item) => item.tongTien.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' }),
    },
    {
      label: "Đã thanh toán",
      className: "px-3 py-4 text-left text-sm tracking-wide text-slate-900 whitespace-nowrap",
      render: (item) => item.daThanhToan ? 'Đã thanh toán' : 'Chưa thanh toán',
    },
    {
      label: "Actions",
      className: "pl-3 pr-4 py-4 text-left text-sm tracking-wide text-slate-900",
      render: (item) => (
        <button className="bg-green-100 px-4 py-2 rounded border-[1.5px] shadow-sm" onClick={() => handleExport(item.id)}>
          Export
        </button>

      ),
    },
  ];

  const handleExport = async (id) => {
      try {
        const orderDetail = orders.find(order => order.id === id);
        const ordersData = await fetch(`http://localhost:8080/api/chitietdonhang/getall/${id}`).then(response => response.json());
        const totalPrice = ordersData.reduce((total, order) => total + order.gia, 0);
        fetch(Logo)
        .then(response => response.blob())
        .then(blob => {
            const reader = new FileReader();
            reader.readAsDataURL(blob);
            reader.onloadend = function() {
                const base64data = reader.result;
              
                const docDefinition = {
                  content: [
                    {
                      image: base64data,
                      width: 200, // Adjust the width as needed
                      alignment: 'center',
                  },
                    { text: `ID Đơn hàng: ${id}`, fontSize: 16, bold: true },
                    { text: `Order ID: ${orderDetail.id}`, fontSize: 14, margin: [0, 10, 0, 5], bold: true },
                    { text: `Ngày đặt: ${new Date(orderDetail.ngayDat).toLocaleDateString()}` },
                    { text: `Tên người nhận: ${orderDetail.tenNguoiNhan}` },
                    { text: `Số điện thoại: ${orderDetail.soDienThoai}` },
                    { text: `Địa chỉ: ${orderDetail.diaChi}` },
                    { text: 'Chi tiết đơn hàng', fontSize: 14, margin: [0, 10, 0, 5], bold: true},
                    {
                      table: {
                        widths: ['auto', 'auto', 'auto'],
                        body: [
                          ['Tiêu đề', 'Số lượng', 'Giá'],
                          ...ordersData.map(order => [
                            order.sach.tieuDe,
                            order.soLuong,
                            order.gia.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })
                          ])
                        ]
                      }
                    },
                    { text: `Tổng giá: ${totalPrice.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' })}`, fontSize: 14, margin: [0, 10, 0, 5], bold: true}
                  ],
                };
                // docDefinition.content.unshift(base64data);
                pdfMake.createPdf(docDefinition).download(`Order_${id}.pdf`);
            }
        });

        
      } catch (error) {
        console.error("Error exporting bill:", error);
    }
  };

  return (
    <div className="m-8">
      <div className="px-4 sm:flex sm:items-center sm:justify-between sm:px-6 lg:px-8">
        <div>
          <h1 className="text-2xl font-medium text-slate-900">Đơn hàng</h1>
        </div>
      </div>

      <div className="p-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
        <div className="bg-white shadow-sm ring-1 ring-slate-200 rounded-md sm:rounded-lg">
          <div className="px-4 py-5 sm:px-6">
            <div className="relative max-w-sm text-slate-400">
              <div className="absolute inset-y-0 left-0 flex items-center pl-3">
                <svg
                  className="h-5 w-5"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  strokeWidth="1.5"
                  stroke="currentColor"
                  aria-hidden="true"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"
                  ></path>
                </svg>
              </div>
              <input
                className="appearance-none w-full border border-slate-300 p-2 pl-10 rounded-md disabled:bg-slate-100 disabled:opacity-50 disabled:cursor-not-allowed"
                placeholder="Tìm kiếm đơn hàng"
                value={searchQuery}
                onChange={handleSearchChange}
              />
            </div>
          </div>

          <DataTable data={filteredOrders} headers={orderHeaders} />
        </div>
      </div>
    </div>
  );
}

export default Order;
