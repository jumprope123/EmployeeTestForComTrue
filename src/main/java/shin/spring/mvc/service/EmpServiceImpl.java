package shin.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shin.spring.mvc.dao.EmpDAO;
import shin.spring.mvc.vo.EmpVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmpServiceImpl implements EmpService{

    @Autowired
    private EmpDAO dao;

    @Override
    public int insertEvo(EmpVO evo) {
        return dao.insertEvo(evo);
    }

    @Override
    public EmpVO readlastEmp() {
        return dao.readLastEmp();
    }

    @Override
    public List<EmpVO> readAllEmp(String cp) {
        int snum = ((Integer.parseInt(cp) -1) * 30); //30명씩 데이터 가져옴
        return dao.selectAllEmp(snum);
    }

    @Override
    public int countData() {
        return dao.selectAllEmpCnt();
    }

    @Override
    public List<EmpVO> readAllEmp(String cp, String findtype, String findkey) {
        int snum = ((Integer.parseInt(cp) -1) * 30); //30명씩 데이터 가져옴
        Map<String, Object> map = new HashMap<>();
        map.put("snum",snum);
        map.put("findtype",findtype);
        map.put("findkey",findkey);
        return dao.selectAllFindEmp(map);
    }

    @Override
    public int countData(String findtype, String findkey) {
        Map<String,String> param = new HashMap<>();
        param.put("findtype", findtype);
        param.put("findkey", findkey);
        return dao.selectAllFindEmpCnt(param);

    }

    @Override
    public EmpVO readOneData(String eno) {
        return dao.selectOneData(eno);
    }

    @Override
    public int platModi(EmpVO evo) {
        return dao.platUpdateData(evo);
    }

    @Override
    public int delData(int eno) {
        return dao.delData(eno);
    }

    @Override
    public int insertmodiEvo(EmpVO evo) {
        return dao.insertModiEvo(evo);
    }
}
