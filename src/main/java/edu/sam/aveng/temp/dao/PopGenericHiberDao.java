package edu.sam.aveng.temp.dao;

import edu.sam.aveng.legacy.contract.dao.GenericHiberDao;
import edu.sam.aveng.base.model.enumeration.Status;
import edu.sam.aveng.base.contract.model.Identifiable;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository

public class PopGenericHiberDao<T extends Identifiable & Serializable>
        extends GenericHiberDao implements IPopGenericHiberDao {

    @Override
    public int populate(long id) {
        return getCurrentSession()
                .createQuery("insert into UserCard (owner, card, status)"
                        + " select :user, c , :status"
                        + " from Card c")
                .setParameter("user", find(id))
                .setParameter("status", Status.NEW)
                .executeUpdate();
    }

}
