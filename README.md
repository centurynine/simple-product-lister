# Simple Product Lister

Flutter project dio & BLoC.

## Screenshots

<p align="center">
  <img src="https://github.com/centurynine/simple-product-lister/blob/main/images/product_page.png?raw=true" width="45%"/> 
  <img src="https://github.com/centurynine/simple-product-lister/blob/main/images/product_detail_page.png?raw=true" width="45%"/>
</p>

## State Management

ใช้ BLoC เป็นตัวจัดการ state ทั้งหมดของแอป โดยแบ่งฝั่งที่เป็น logic & ui 
- ฝั่ง logic โดยหลังจากเข้าสู่แอปก็จะส่ง event ที่เป็น loading เข้าสู่ BLoC เพื่อสั่งให้มีการโหลดข้อมูลจาก api หลังจากนั้นถ้าโหลดข้อมูลสำเร็จก็จะทำการส่ง event ที่เป็น loaded เข้าสู่ BLoC แต่ถ้าหากโหลดไม่สำเร็จก็จะส่ง event ที่เป็น error เข้าสู่ BLoC และมีการแบ่งว่าเป็น error จาก network หรือของฝั่ง client เอง
- ฝั่ง ui ก็จะเช็คว่าในขณะนี้ event ของ BLoC เป็น event อะไร (loading, loaded, error) จากนั้นก็ทำการสร้าง ui ตาม event

## AI Tools

- Github Copilot ใช้ในการ suggestion code
- ChatGPT ใช้ในการถามคำถามทั่วไป เช่น การวางรูปแบบ structure
