package egg.finalproject.configurator;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class SpringContext implements ApplicationContextAware{
	//ApplicationContextAware 인터페이스를 구현한 클래스 인스턴스가 생성되면 ApplicationContext setter가 자동적으로 호출됨
	private static ApplicationContext context;
	
	@Override // 스프링 컨테이너가 가동될 때 이 세터가 실행되면 현재 실행된 스프링컨테이너 주소값을 context 멤버필드에 셋팅
	public void setApplicationContext(ApplicationContext context) throws BeansException{
		SpringContext.context = context;
	}

	public static BeanFactory getApplicationContext() {
		return context;
	}
}
