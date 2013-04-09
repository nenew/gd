package hebernate;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Thesis entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hebernate.Thesis
 * @author MyEclipse Persistence Tools
 */

public class ThesisDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(ThesisDAO.class);
	// property constants
	public static final String ISUPLOADED = "isuploaded";
	public static final String VERYFICATION = "veryfication";
	public static final String DOWNLOADPATH = "downloadpath";

	public void save(Thesis transientInstance) {
		log.debug("saving Thesis instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Thesis persistentInstance) {
		log.debug("deleting Thesis instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Thesis findById(java.lang.Integer id) {
		log.debug("getting Thesis instance with id: " + id);
		try {
			Thesis instance = (Thesis) getSession().get("hebernate.Thesis", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Thesis instance) {
		log.debug("finding Thesis instance by example");
		try {
			List results = getSession().createCriteria("hebernate.Thesis")
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
		log.debug("finding Thesis instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Thesis as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByIsuploaded(Object isuploaded) {
		return findByProperty(ISUPLOADED, isuploaded);
	}

	public List findByVeryfication(Object veryfication) {
		return findByProperty(VERYFICATION, veryfication);
	}

	public List findByDownloadpath(Object downloadpath) {
		return findByProperty(DOWNLOADPATH, downloadpath);
	}

	public List findAll() {
		log.debug("finding all Thesis instances");
		try {
			String queryString = "from Thesis";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Thesis merge(Thesis detachedInstance) {
		log.debug("merging Thesis instance");
		try {
			Thesis result = (Thesis) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Thesis instance) {
		log.debug("attaching dirty Thesis instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Thesis instance) {
		log.debug("attaching clean Thesis instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}