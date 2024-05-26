package com.devpro.shop16.dto;

import lombok.Data;
import lombok.ToString;

@ToString
public class AddProduct {
	private String maSP, tenSP, loaiSP;
	private double total;
	private String productAvatar;
	private String productPictures;
	public String getMaSP() {
		return maSP;
	}
	public void setMaSP(String maSP) {
		this.maSP = maSP;
	}
	public String getTenSP() {
		return tenSP;
	}
	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}
	public String getLoaiSP() {
		return loaiSP;
	}
	public void setLoaiSP(String loaiSP) {
		this.loaiSP = loaiSP;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getProductAvatar() {
		return productAvatar;
	}
	public void setProductAvatar(String productAvatar) {
		this.productAvatar = productAvatar;
	}
	public String getProductPictures() {
		return productPictures;
	}
	public void setProductPictures(String productPictures) {
		this.productPictures = productPictures;
	}
	

}
