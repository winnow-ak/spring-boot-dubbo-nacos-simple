package winnow.ak.study.consumer;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.apache.dubbo.config.annotation.Reference;
import winnow.ak.study.biz.HelloService;

/**
 * @Author: Winyu
 * @Date: 2020/12/13
 */
@RestController
public class ConsumerController {

    @Reference
    private HelloService helloService;

    @GetMapping("/say")
    public String sayHello(String name){
        return helloService.sayHello(name);
    }
}
