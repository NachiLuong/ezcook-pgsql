
import com.ezcook.daos.ICommentDao;
import com.ezcook.daos.IUserDao;
import com.ezcook.daos.impls.CommentDao;
import com.ezcook.daos.impls.UserDao;
import com.ezcook.entities.Comment;
import com.ezcook.entities.User;
import org.testng.annotations.Test;

import java.sql.Timestamp;
import java.util.List;

public class testSave {
    @Test
    public void checkfindAll(){
        IUserDao userDao=new UserDao();
        List<User> list= userDao.findAll();
    }

}
