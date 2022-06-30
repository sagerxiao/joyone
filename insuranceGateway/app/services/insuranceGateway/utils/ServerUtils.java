package services.insuranceGateway.utils;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import play.Play;
import play.server.Server;

/**
 * 服务器信息获取工具类
 * @author andy
 */
public class ServerUtils {
	private static Logger logger = LoggerFactory.getLogger(ServerUtils.class);
	private static String intranetPort = Play.configuration.getProperty("job.appserver.intranet.port", "9010");
	
	/**
	 * 验证当前服务器是否属于配置中的ip地址(job.appserver.intranet.ip)
	 * 若配置中没有配置则默认返回true
	 * @return
	 */
	public static Boolean validateIntranetIp() {
		return validateIntranetIp("job.appserver.intranet.ip", Integer.parseInt(intranetPort));
	}

	public static Boolean validateIntranetIp(String configPropertyName,int jobPort) {
		Boolean validateFlag = true;
		String intranetIp = Play.configuration.getProperty(configPropertyName);
		//若配置中没有配置则默认返回true
		if (StringUtils.isEmpty(intranetIp)) {
			return validateFlag;	
		}
		//配置ip和获取的当前服务器内网ip不一致则返回false
		if (!intranetIp.equals(getRealIntranetIp())) {
			validateFlag = false;
		}
		
		//如果是qa环境
		/*if(Play.id.equals("qa") || Play.id.equals("hutao")){
			
		}*/
		//需要判断本服务的端口
		if(Server.httpPort != jobPort){
		    validateFlag =  false;
		}
		return validateFlag;
	}

	/**
	 * 获取应用服务器内网IP地址
	 * @return
	 */
	public static String getRealIntranetIp(){
		String intranetIp = "";
		Enumeration<NetworkInterface> netInterfaces = null;
		try {
			netInterfaces = NetworkInterface.getNetworkInterfaces();
		} catch (SocketException e) {
			logger.error("getRealIntranetIp error...", e);
			return intranetIp;
		}
		InetAddress ip = null;
		Boolean findFlag = false;
		NetworkInterface ni;
		Enumeration<InetAddress> address;
		while (netInterfaces.hasMoreElements() && !findFlag) {
			ni = netInterfaces.nextElement();
			address = ni.getInetAddresses();
			while (address.hasMoreElements()) {
				ip = address.nextElement();
				//内网ip判断条件
				if (ip.isSiteLocalAddress() && !ip.isLoopbackAddress() && ip.getHostAddress().indexOf(":") == -1) {// 内网IP
					intranetIp = ip.getHostAddress();
					logger.debug("ip address of the application server："+intranetIp);
					return intranetIp;
				}
			}
		}
		return intranetIp;
	}

	public static void main(String arg[]) throws SocketException {
		System.out.println(getRealIntranetIp());
	}
}
