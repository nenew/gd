package hebernate;

import java.util.Date;
import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Proposal entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see hebernate.Proposal
 * @author MyEclipse Persistence Tools
 */

public class ProposalDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ProposalDAO.class);
	// property constants
	public static final String STUDENTID = "studentid";
	public static final String THESISTITLE = "thesistitle";
	public static final String PROPOSALANALYSIS = "proposalanalysis";
	public static final String PROPOSALCONTENT = "proposalcontent";
	public static final String PROPOSALFACILITY = "proposalfacility";
	public static final String PROPOSALPROCESS = "proposalprocess";
	public static final String PROCESSNUM = "processnum";
	public static final String ISCHOOSEN = "ischoosen";
	public static final String VERIFICATION = "verification";
	public static final String ISAPPROVED = "isapproved";
	public static final String REQUIREMENT = "requirement";
	public static final String CONTENT = "content";
	public static final String STANDERD = "standerd";
	public static final String PROCESS = "process";
	public static final String LITERATURE = "literature";

	public void save(Proposal transientInstance) {
		log.debug("saving Proposal instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Proposal persistentInstance) {
		log.debug("deleting Proposal instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Proposal findById(java.lang.Integer id) {
		log.debug("getting Proposal instance with id: " + id);
		try {
			Proposal instance = (Proposal) getSession().get(
					"hebernate.Proposal", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Proposal instance) {
		log.debug("finding Proposal instance by example");
		try {
			List results = getSession().createCriteria("hebernate.Proposal")
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
		log.debug("finding Proposal instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Proposal as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByStudentid(Object studentid) {
		return findByProperty(STUDENTID, studentid);
	}

	public List findByThesistitle(Object thesistitle) {
		return findByProperty(THESISTITLE, thesistitle);
	}

	public List findByProposalanalysis(Object proposalanalysis) {
		return findByProperty(PROPOSALANALYSIS, proposalanalysis);
	}

	public List findByProposalcontent(Object proposalcontent) {
		return findByProperty(PROPOSALCONTENT, proposalcontent);
	}

	public List findByProposalfacility(Object proposalfacility) {
		return findByProperty(PROPOSALFACILITY, proposalfacility);
	}

	public List findByProposalprocess(Object proposalprocess) {
		return findByProperty(PROPOSALPROCESS, proposalprocess);
	}

	public List findByProcessnum(Object processnum) {
		return findByProperty(PROCESSNUM, processnum);
	}

	public List findByIschoosen(Object ischoosen) {
		return findByProperty(ISCHOOSEN, ischoosen);
	}

	public List findByVerification(Object verification) {
		return findByProperty(VERIFICATION, verification);
	}

	public List findByIsapproved(Object isapproved) {
		return findByProperty(ISAPPROVED, isapproved);
	}

	public List findByRequirement(Object requirement) {
		return findByProperty(REQUIREMENT, requirement);
	}

	public List findByContent(Object content) {
		return findByProperty(CONTENT, content);
	}

	public List findByStanderd(Object standerd) {
		return findByProperty(STANDERD, standerd);
	}

	public List findByProcess(Object process) {
		return findByProperty(PROCESS, process);
	}

	public List findByLiterature(Object literature) {
		return findByProperty(LITERATURE, literature);
	}

	public List findAll() {
		log.debug("finding all Proposal instances");
		try {
			String queryString = "from Proposal";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Proposal merge(Proposal detachedInstance) {
		log.debug("merging Proposal instance");
		try {
			Proposal result = (Proposal) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Proposal instance) {
		log.debug("attaching dirty Proposal instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Proposal instance) {
		log.debug("attaching clean Proposal instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}