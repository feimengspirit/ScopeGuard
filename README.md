####ScopeGuard

**说明:**

利用C++对象的构造和析构(超出作用域)实现的ScopeGuard工具。可以用于资源的释放等。

**范例:**

	void func1()
	{
		Resource r1 = CreateResource();
	    ON_SCOPE_EXIT([&] { Release(r1); });
	    	
	    return;
	}


	Resource func1()
	{
		Resource r1 = CreateResource();
	    ScopeGuard sg([&] { Release(r1); });
	    
	    result_t rtn = doAnotherJob();
	    if (rtn == OK) {
	    	sg.Dismiss();
	    	return rtn;
	    }
	
	    return nullptr;
	}
