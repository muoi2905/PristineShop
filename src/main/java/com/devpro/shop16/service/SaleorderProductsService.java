package com.devpro.shop16.service;

import com.devpro.shop16.dto.OrderSearchModel;
import com.devpro.shop16.entities.SaleorderProducts;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class SaleorderProductsService extends BaseService<SaleorderProducts>{

	@Override
	protected Class<SaleorderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleorderProducts.class;
	}

	public PagerData<SaleorderProducts> search(OrderSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_saleorder_products p WHERE 1=1 and status = 1";
		if (searchModel != null) {
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.saleorder_id like '%" + searchModel.keyword + "%')";
			}
		}
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
	}
	
	public PagerData<SaleorderProducts> search(String email) {
		String sql = "SELECT p.* FROM tbl_saleorder_products p INNER JOIN tbl_saleorder so ON p.saleorder_id = so.id WHERE 1=1 and p.status = 1";
		if (email != null) {
			if (!StringUtils.isEmpty(email)) {
				sql += " and (so.customer_email like '%" + email + "%')";
			}
		}
		return executeByNativeSQL(sql, 0);
	}
}
