package hibernate;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Management entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hibernate.Management
 * @author MyEclipse Persistence Tools
 */

public class ManagementDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ManagementDAO.class);
	// property constants
	public static final String LIMITNUM = "limitnum";

	public void save(Management transientInstance) {
		log.debug("saving Management instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Management persistentInstance) {
		log.debug("deleting Management instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Management findById(java.lang.Integer id) {
		log.debug("getting Management instance with id: " + id);
		try {
			Management instance = (Management) getSession().get(
					"hibernate.Management", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Management instance) {
		log.debug("finding Management instance by example");
		try {
			List results = getSession().createCriteria("hibernate.Management")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Management instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Management as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByLimitnum(Object limitnum) {
		return findByProperty(LIMITNUM, limitnum);
	}

	public List findAll() {
		log.debug("finding all Management instances");
		try {
			String queryString = "from Management";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Management merge(Management detachedInstance) {
		log.debug("merging Management instance");
		try {
			Management result = (Management) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Management instance) {
		log.debug("attaching dirty Management instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Management instance) {
		log.debug("attaching clean Management instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}