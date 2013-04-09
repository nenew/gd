package hebernate;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Profile entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hebernate.Profile
 * @author MyEclipse Persistence Tools
 */

public class ProfileDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(ProfileDAO.class);
	// property constants
	public static final String DEPARTMENT = "department";
	public static final String GRADE = "grade";
	public static final String EMAIL = "email";
	public static final String PHONENUM = "phonenum";
	public static final String TITLE = "title";
	public static final String ISFILLED = "isfilled";

	public void save(Profile transientInstance) {
		log.debug("saving Profile instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Profile persistentInstance) {
		log.debug("deleting Profile instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Profile findById(java.lang.Integer id) {
		log.debug("getting Profile instance with id: " + id);
		try {
			Profile instance = (Profile) getSession().get("hebernate.Profile",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Profile instance) {
		log.debug("finding Profile instance by example");
		try {
			List results = getSession().createCriteria("hebernate.Profile")
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
		log.debug("finding Profile instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Profile as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDepartment(Object department) {
		return findByProperty(DEPARTMENT, department);
	}

	public List findByGrade(Object grade) {
		return findByProperty(GRADE, grade);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByPhonenum(Object phonenum) {
		return findByProperty(PHONENUM, phonenum);
	}

	public List findByTitle(Object title) {
		return findByProperty(TITLE, title);
	}

	public List findByIsfilled(Object isfilled) {
		return findByProperty(ISFILLED, isfilled);
	}

	public List findAll() {
		log.debug("finding all Profile instances");
		try {
			String queryString = "from Profile";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Profile merge(Profile detachedInstance) {
		log.debug("merging Profile instance");
		try {
			Profile result = (Profile) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Profile instance) {
		log.debug("attaching dirty Profile instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Profile instance) {
		log.debug("attaching clean Profile instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}