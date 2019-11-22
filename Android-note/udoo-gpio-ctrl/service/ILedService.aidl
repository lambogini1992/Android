package android.os;
/**
* {@hide}
*/
interface ILedService {
	void init(String name);
	void config(int val);
}
