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
    T findEqualUnique(String property, Object value);
}
