package com.devpro.shop16.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public abstract class BaseSearchModel {

	protected int page;
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPage() {
		return this.page;
	}

}
