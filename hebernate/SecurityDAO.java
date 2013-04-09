package hebernate;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Security entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hebernate.Security
 * @author MyEclipse Persistence Tools
 */

public class SecurityDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(SecurityDAO.class);
	// property constants
	public static final String QUESTION = "question";
	public static final String IDCARD = "idcard";
	public static final String ISFILLED = "isfilled";

	public void save(Security transientInstance) {
		log.debug("saving Security instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Security persistentInstance) {
		log.debug("deleting Security instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Security findById(java.lang.Integer id) {
		log.debug("getting Security instance with id: " + id);
		try {
			Security instance = (Security) getSession().get(
					"hebernate.Security", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Security instance) {
		log.debug("finding Security instance by example");
		try {
			List results = getSession().createCriteria("hebernate.Security")
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
		log.debug("finding Security instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Security as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByQuestion(Object question) {
		return findByProperty(QUESTION, question);
	}

	public List findByIdcard(Object idcard) {
		return findByProperty(IDCARD, idcard);
	}

	public List findByIsfilled(Object isfilled) {
		return findByProperty(ISFILLED, isfilled);
	}

	public List findAll() {
		log.debug("finding all Security instances");
		try {
			String queryString = "from Security";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Security merge(Security detachedInstance) {
		log.debug("merging Security instance");
		try {
			Security result = (Security) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Security instance) {
		log.debug("attaching dirty Security instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Security instance) {
		log.debug("attaching clean Security instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}