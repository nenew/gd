package hibernate;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Process entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hibernate.Process
 * @author MyEclipse Persistence Tools
 */

public class ProcessDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(ProcessDAO.class);
	// property constants
	public static final String PLANNUM = "plannum";
	public static final String FINISHNUM = "finishnum";
	public static final String ISPLANED = "isplaned";

	public void save(Process transientInstance) {
		log.debug("saving Process instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Process persistentInstance) {
		log.debug("deleting Process instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Process findById(java.lang.Integer id) {
		log.debug("getting Process instance with id: " + id);
		try {
			Process instance = (Process) getSession().get("hibernate.Process",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Process instance) {
		log.debug("finding Process instance by example");
		try {
			List results = getSession().createCriteria("hibernate.Process")
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
		log.debug("finding Process instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Process as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPlannum(Object plannum) {
		return findByProperty(PLANNUM, plannum);
	}

	public List findByFinishnum(Object finishnum) {
		return findByProperty(FINISHNUM, finishnum);
	}

	public List findByIsplaned(Object isplaned) {
		return findByProperty(ISPLANED, isplaned);
	}

	public List findAll() {
		log.debug("finding all Process instances");
		try {
			String queryString = "from Process";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Process merge(Process detachedInstance) {
		log.debug("merging Process instance");
		try {
			Process result = (Process) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Process instance) {
		log.debug("attaching dirty Process instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Process instance) {
		log.debug("attaching clean Process instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}