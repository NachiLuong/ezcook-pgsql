package com.ezcook.utils;

import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;

public class FormUtil {
    public static <T> T populate(Class<T> clazz, HttpServletRequest request) {
        T object = null;
        try {
<<<<<<< HEAD
            object = clazz.newInstance();
            BeanUtils.populate(object, request.getParameterMap());
        } catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
=======
            object= clazz.newInstance();
            BeanUtils.populate(object, request.getParameterMap());
        }catch (InstantiationException ignored){

        }catch (IllegalAccessException | InvocationTargetException e){
>>>>>>> 8eb3027fdeb4c0b0afb0bedf64a5833b754613fe
            e.printStackTrace();
        }
        return object;
    }
}
