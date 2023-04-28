package com.lec.bowow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.bowow.dao.OrderDao;
import com.lec.bowow.model.Order;
@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public int insertOrder(Order order) {
		return orderDao.insertOrder(order);
	}
	
	

}
