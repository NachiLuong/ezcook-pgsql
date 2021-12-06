package com.ezcook.daos;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IGenericDao<ID extends Serializable, T>
{
    List<T> querySelector(String hqlQuery);
    List<T> findAll();
    T update(T entity);
    void save(T entity);
    T findByID(ID id);
    Object[] findByProperty(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit);
    Integer delete(List<ID> ids);
    T findEqualUnique(String property, Object value);
}
