package shin.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import shin.spring.mvc.service.EmpService;
import shin.spring.mvc.vo.EmpVO;

@Controller
public class IndexController {

    @Autowired
    private EmpService esrv;

    @GetMapping("/")
    public String index(){
        return "index.tiles";
    }

    @GetMapping("/write")
    public String write(){
        return "write.tiles";
    }

    @PostMapping("/writeOk")
    public ModelAndView writeOk(ModelAndView mv, EmpVO evo){
        mv.setViewName("/writeOk.tiles");
        int cnt = esrv.insertEvo(evo);
        if (cnt>0){
            System.out.println("data input success");
        }else {
            System.out.println("data input fail");
        }
        EmpVO readLastEvo = esrv.readlastEmp();

        mv.addObject("evo",readLastEvo);
        return mv;
    }

    @GetMapping("/list")
    public ModelAndView list(ModelAndView mv, String cp){
        if (cp == null || cp.isEmpty()) {cp = "1";}
        mv.setViewName("/list.tiles");
        mv.addObject("data",esrv.readAllEmp(cp)); //30개씩 데이터를 잘라서 가져옴 이름 오름차순 정렬
        mv.addObject("dataCnt",esrv.countData()); //총 몇개의 데이터인지 확인함
        return mv;
    }

    @GetMapping("/find")
    public ModelAndView fin(ModelAndView mv, String findtype, String findkey, String cp){
        mv.setViewName("/list.tiles");
        mv.addObject("data",esrv.readAllEmp(cp,findtype,findkey)); //30개씩 데이터를 잘라서 가져옴 이름 오름차순 정렬
        mv.addObject("dataCnt",esrv.countData(findtype,findkey)); //총 몇개의 데이터인지 확인함
        return mv;
    }

    @GetMapping("/modifyData")
    public ModelAndView modifyData(ModelAndView mv, String eno){
        mv.setViewName("/modifyData.tiles");
        mv.addObject("Data",esrv.readOneData(eno));

        return mv;
    }

    @PostMapping("/modiOk")
    public String modiOk(EmpVO evo, String beforeEno, String afterEno){
        //만약 eno가 수정되지 않았다면?
        if (beforeEno == null || beforeEno.isEmpty()) {beforeEno = "-1";}
        if (afterEno == null || afterEno.isEmpty()) {afterEno = "-1";}

        // 수정되지 않은 eno 일때
        if (beforeEno == "-1") {
            int cnt = esrv.platModi(evo);
            if (cnt > 0) {
                System.out.println("update ok");
            } else {
                System.out.println("update fail");
            }
        } else {// 만약 eno가 수정되었다면?
            //일단 기존 eno번 데이터는 삭제
            int cnt = esrv.delData(Integer.parseInt(beforeEno));
            if (cnt > 0) {
                System.out.println("delete is ok");
            } else {
                System.out.println("delete is fail");
            }
            // 새로운 eno번 데이터 삽입
            int cnt2 = esrv.insertmodiEvo(evo);
            if (cnt2>0){
                System.out.println("data input success");
            }else {
                System.out.println("data input fail");
            }
        }

        return "redirect:/list";
    }

    @GetMapping("/delData")
    public String delData(String eno){
        int cnt = esrv.delData(Integer.parseInt(eno));
        if (cnt > 0) {
            System.out.println("delete is ok");
        } else {
            System.out.println("delete is fail");
        }
        return "redirect:/list";
    }

}
