package com.ezcook.daos;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IGenericDao<ID extends Serializable, T>
{
    List<T> findAll();
    T update(T entity);
    void save(T entity);
    T findByID(ID id);
    Integer delete(List<ID> ids);
    Long count();
    List<T> pagination(Integer pageNumber, Integer pageSize);
    List<T> paginationSearch(Integer pageNumber, Integer pageSize, String key, Object value);
    T findEqualUnique(String property, Object value);
    boolean isUnique(String property, String value);
    List<T> querySelector(String hqlQuery);
}
