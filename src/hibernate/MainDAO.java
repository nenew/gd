package hibernate;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for Main
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see hibernate.Main
 * @author MyEclipse Persistence Tools
 */

public class MainDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(MainDAO.class);
	// property constants
	public static final String NUM = "num";
	public static final String NAME = "name";
	public static final String PRIORITY = "priority";
	public static final String PASSWORD = "password";
	public static final String COOKIE = "cookie";
	public static final String ISPROFILE = "isprofile";
	public static final String ISSECURITY = "issecurity";

	public void save(Main transientInstance) {
		log.debug("saving Main instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Main persistentInstance) {
		log.debug("deleting Main instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Main findById(java.lang.Integer id) {
		log.debug("getting Main instance with id: " + id);
		try {
			Main instance = (Main) getSession().get("hibernate.Main", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Main instance) {
		log.debug("finding Main instance by example");
		try {
			List results = getSession().createCriteria("hibernate.Main")
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
		log.debug("finding Main instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Main as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByNum(Object num) {
		return findByProperty(NUM, num);
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByPriority(Object priority) {
		return findByProperty(PRIORITY, priority);
	}

	public List findByPassword(Object password) {
		return findByProperty(PASSWORD, password);
	}

	public List findByCookie(Object cookie) {
		return findByProperty(COOKIE, cookie);
	}

	public List findByIsprofile(Object isprofile) {
		return findByProperty(ISPROFILE, isprofile);
	}

	public List findByIssecurity(Object issecurity) {
		return findByProperty(ISSECURITY, issecurity);
	}

	public List findAll() {
		log.debug("finding all Main instances");
		try {
			String queryString = "from Main";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Main merge(Main detachedInstance) {
		log.debug("merging Main instance");
		try {
			Main result = (Main) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Main instance) {
		log.debug("attaching dirty Main instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Main instance) {
		log.debug("attaching clean Main instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public Integer count() {
		log.debug("Count Main instance");
		try {
			String queryString = "select count(m) from Main as m where m.priority = 3";
			Query queryObject = getSession().createQuery(queryString);
			Number s = (Number) queryObject.list().get(0);
			return s.intValue();
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public Integer count(String propertyName, Object value) {
		log.debug("Count Main instance");
		try {
			String queryString = "select count(m) from Main as m where m."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			Number s = (Number) queryObject.list().get(0);
			return s.intValue();
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public List<?> page() {
		log.debug("管理员分页");
		try {
			String queryString = "select m from Main as m where m.priority= 3";
			Query queryObject = getSession().createQuery(queryString)
					.setFirstResult(0).setMaxResults(10);
			List<?> s = (List<?>) queryObject.list();
			return s;
		} catch (RuntimeException re) {
			log.error("count failed", re);
			throw re;
		}
	}

	public List<?> page(String index) {
		log.debug("管理员分页");
		try {
			String queryString = "select m from Main as m where m.priority= 3";
			Query queryObject = getSession().createQuery(queryString)
					.setFirstResult(Integer.parseInt(index)).setMaxResults(10);
			List<?> s = (List<?>) queryObject.list();
			return s;
		} catch (RuntimeException re) {
			log.error("count failed", re);
			throw re;
		}
	}
	public Integer counts() {
		log.debug("Count Profile instance");
		try {
			String queryString = "select count(m) from Main as m";
			Query queryObject = getSession().createQuery(queryString);
			Number s = (Number) queryObject.list().get(0);
			return s.intValue();
		} catch (RuntimeException re) {
			log.error("count failed", re);
			throw re;
		}
	}

	public Integer counts(String propertyName, Object value) {
		log.debug("Count Profile instance");
		try {
			String queryString = "select count(m) from Main as m where m."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			Number s = (Number) queryObject.list().get(0);
			return s.intValue();
		} catch (RuntimeException re) {
			log.error("count failed", re);
			throw re;
		}
	}
}