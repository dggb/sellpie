---------������̺�, ������ ���� ����------------
SELECT 'DROP '||object_type||' '|| object_name || DECODE(OBJECT_TYPE,'TABLE',' CASCADE CONSTRAINTS;',';')
FROM user_objects;

---------�Ʒ��� ������ ������ CTRL+A �ϰ� ����, ��� ����-----------
---------���� ���� ���� ��� ����---------------------------------