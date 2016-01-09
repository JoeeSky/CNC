package org.nfmedia.crms.usertype;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.NoSuchElementException;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.nfmedia.crms.cons.UserState;

/**
 * UserState对应hibernate映射类型
 * @author: hongwei
 * @CreateDate: 2014-11-15 下午7:32:01 
 */
public class UserStateUserType extends EnumUserTypeSupport<UserState> {

	
	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#nullSafeGet(java.sql.ResultSet, java.lang.String[], java.lang.Object)
	 */
	@Override
	public Object nullSafeGet(ResultSet arg0, String[] arg1, Object arg2)
			throws HibernateException, SQLException {
		Character symbol = (Character) Hibernate.CHARACTER.nullSafeGet(arg0, arg1[0]);
		if(symbol == null){
			return null;
		}
		try {
			return UserState.getInstanceBySymbol(symbol);
		} catch (NoSuchElementException e) {
			throw new HibernateException("Bad UserState value: "+symbol, e);
		}
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#nullSafeSet(java.sql.PreparedStatement, java.lang.Object, int)
	 */
	@Override
	public void nullSafeSet(PreparedStatement arg0, Object arg1, int arg2)
			throws HibernateException, SQLException {
		Character symbol = null;
		if(arg1 != null){
			symbol = ((UserState)arg1).getSymbol();
		}
		Hibernate.CHARACTER.nullSafeSet(arg0, symbol, arg2);
	}

}
