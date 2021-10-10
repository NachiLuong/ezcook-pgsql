import com.ezcook.daoimpls.CommentDaoImpl;
import com.ezcook.daos.CommentDao;
import com.ezcook.entity.CommentEntity;
import org.testng.annotations.Test;

import java.util.List;

public class CommentTest {
    @Test
    public void checkfindAll(){
        CommentDao commentDao=new CommentDaoImpl();
        List<CommentEntity> list= commentDao.findAll();
    }

}
