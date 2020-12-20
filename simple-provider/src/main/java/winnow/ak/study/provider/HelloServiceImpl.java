package winnow.ak.study.provider;


import org.apache.dubbo.config.annotation.Service;
import winnow.ak.study.biz.HelloService;

/**
 * @Author: Winyu
 * @Date: 2020/12/12
 */
@Service
public class HelloServiceImpl implements HelloService {

    @Override
    public String sayHello(String name) {
        System.out.println("say hello  " + name);
        return "hello " + name;
    }
}
