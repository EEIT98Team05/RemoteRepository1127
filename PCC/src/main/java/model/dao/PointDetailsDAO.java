package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.bean.PointDetails;

@Repository
public class PointDetailsDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	//SELECT gettingDate,memberId,getWay,getPoint FROM PointDetails WHERE memberId='Tester';
	public List<PointDetails> selectpoint(String memberId) {
		Query<PointDetails> query=getSession().createQuery("FROM PointDetails WHERE memberId=?",PointDetails.class);
		query.setParameter(0, memberId);
		return query.list();
	}
	
	public boolean insertPoint(PointDetails pointDetails) {
		getSession().save(pointDetails);
		return true;
	}

}
