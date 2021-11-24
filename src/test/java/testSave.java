
import com.ezcook.daos.*;
import com.ezcook.daos.impls.*;
import com.ezcook.entities.*;
import org.testng.annotations.Test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class testSave {
    @Test
    public void checkfindAll(){
//        IUserDao userDao=new UserDao();
//        List<User> list= userDao.findAll();

//        IFoodDao foodDao=new FoodDao();
//        List<Food> lst= foodDao.findAll();

     /*   IUserDao userDao=new UserDao();
        List<Integer> list= new ArrayList<>();
        list.add(5);
        userDao.delete(list);*/

        //List<User> userList= userDao.paginationSearch(1,7, "username", "tr");
        //List<User> aaaa=userDao.pagination(1,3);
       // Long aaa=userDao.count();

        IUserDao userDao=new UserDao();
        Boolean a= userDao.isUnique("username", "trung");
        System.out.println("sdfsdfd");
    }

}
