package com.kwchina.oa.purchase.yiban.dao;

import com.kwchina.core.common.dao.BasicDao;
import com.kwchina.oa.purchase.yiban.entity.PurchaseCheckInfor;
import com.kwchina.oa.workflow.entity.InstanceCheckInfor;

import java.util.List;

public interface PurchaseCheckDAO extends BasicDao<PurchaseCheckInfor>{
	
	/**
	 * 查找某个实例的全部审核信息
	 * @param instanceId
	 * @return
	 */
	public List findChecksByInstance(int instanceId);
	
	/**
	 * 查找某个实例，某个层次的全部审核信息
	 * @param layerId
	 * @return
	 */
	public List findChecksByLayer(int layerId);
	
	
	/**
	 * 查找某个人全部审核信息
	 * @param personId
	 * @return
	 */
	public List findPersonCheckInfor(int personId);
	
	
	/**
	 * 查找某个实例，某个层次的全部审核信息
	 * @param personId
	 * @return
	 */
	public List findPersonUncheckInfor(int personId);
	
}
