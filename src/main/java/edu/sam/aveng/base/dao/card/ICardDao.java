package edu.sam.aveng.base.dao.card;

import edu.sam.aveng.base.contract.dao.IGenericDao;
import edu.sam.aveng.base.model.entity.Card;
import edu.sam.aveng.base.model.enumeration.Lang;
import edu.sam.aveng.base.model.transfer.dto.CardTableItem;

import java.util.List;
import java.util.Map;

public interface ICardDao extends IGenericDao<Card> {

    List<CardTableItem> findAllAsTableItems();

    List<Map> search(Lang cardLang, Lang coupledCardsLang, String formattedSearchInput);

}
