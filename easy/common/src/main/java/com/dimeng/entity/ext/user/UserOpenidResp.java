package com.dimeng.entity.ext.user;

import com.dimeng.framework.domain.BaseResp;

public class UserOpenidResp extends BaseResp{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7865042869763139957L;

	private String opendId;

	public String getOpendId() {
		return opendId;
	}

	public void setOpendId(String opendId) {
		this.opendId = opendId;
	}
	
}
