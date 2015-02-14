dataSource {
	pooled = true
	driverClassName = "org.h2.Driver"
	username = "sa"
	password = ""
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = false
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/techbook"
			driverClassName = "com.mysql.jdbc.Driver"
			username = "root"
			password = "hadoop"
			properties {
				maxActive = -1
				minEvictableIdleTimeMillis=1800000
				timeBetweenEvictionRunsMillis=1800000
				numTestsPerEvictionRun=3
				testOnBorrow=true
				testWhileIdle=true
				testOnReturn=true
				validationQuery="SELECT 1"
			}
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
		}
	}
	production {
		dataSource {
			pooled = true
			dbCreate = "update"
			url = ""
			driverClassName = "com.mysql.jdbc.Driver"
			username = ""
			password = ""
			pooled = true
			properties {
				initialSize = 5
				maxActive = 50
				minIdle = 5
				maxIdle = 25
				maxWait = 10000
				timeBetweenEvictionRunsMillis = 5000
				minEvictableIdleTimeMillis = 60000
				numTestsPerEvictionRun=3
				validationQuery = "SELECT 1"
				validationQueryTimeout = 3
				testOnBorrow=true
				testWhileIdle=true
				testOnReturn=false
			}
		}
	}
}
