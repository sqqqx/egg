package egg.finalproject.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class SpringContext implements ApplicationContextAware{
	// ApplicationContextAware 인터페이스를 구현한 클래스 인스턴스가 생상되면 ApplicationContext setter가 자동으로 호출 됨
	private static ApplicationContext context;
	
	@Override // 스프링 컨테이너가 가동될 때 이 세터가 실행이 되면 현재 실행된 스프링컨테이너의 주소 값을 context 멤버필드에 세팅
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		SpringContext.context = context;
	}
	
	// context 멤버필드 안에 담겨 있는 스프링 컨테이너의 주소값을 반환하는 메서드
	public static ApplicationContext getApplicationContext() {
		return context;
	}
	
}
