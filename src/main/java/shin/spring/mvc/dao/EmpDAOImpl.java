package shin.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import shin.spring.mvc.vo.EmpVO;

import java.util.List;
import java.util.Map;

@Repository
public class EmpDAOImpl implements EmpDAO{

    @Autowired
    private SqlSession sqlSession;


    @Override
    public int insertEvo(EmpVO evo) {
        return sqlSession.insert("emp.insertEvo",evo);
    }

    @Override
    public EmpVO readLastEmp() {
        return sqlSession.selectOne("emp.readLastEmp");
    }

    @Override
    public List<EmpVO> selectAllEmp(int snum) {
        return sqlSession.selectList("emp.readAllData",snum);
    }

    @Override
    public int selectAllEmpCnt() {
        return sqlSession.selectOne("emp.readAllDataCnt");
    }

    @Override
    public List<EmpVO> selectAllFindEmp(Map<String, Object> map) {
        return sqlSession.selectList("emp.readAllFindData",map);
    }

    @Override
    public int selectAllFindEmpCnt(Map<String, String> map) {
        return sqlSession.selectOne("emp.readAllFindDataCnt",map);
    }

    @Override
    public EmpVO selectOneData(String eno) {
        return sqlSession.selectOne("emp.readOneData",eno);
    }

    @Override
    public int platUpdateData(EmpVO evo) {
        return sqlSession.update("emp.platUpdateData",evo);
    }

    @Override
    public int delData(int eno) {
        return sqlSession.delete("emp.delData",eno);
    }

    @Override
    public int insertModiEvo(EmpVO evo) {
        return sqlSession.insert("emp.insertModiEvo",evo);
    }
}
