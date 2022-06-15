-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: baseisdatabase
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(40) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `image` longblob,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('ikara','12345678','Yiannis','Karampinis',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\�\0\0\0\�\0\0\0��^�\0\0VPLTE����࢈\�\��ۼ�xAG+)����\�Y�\�>TQ,+����\�����\�\�\�H]�\��\�\���\��\���\���\���\�u\�\�\0����(\�\��}��\�\��לЭ���Q��b�dOw��{���\�|�\�A�r?R51\�̰\�ɓ����\�3�\��bF;�k=��wqUE�U6�}o��isNHڸ�¦{��\�o���\�\�Ï[7,g@/ϳ��nV�b:yK3eI=\�§��vɥ�gA>��c}aMsVK�f\\�\�l^ehSHIr��ewzZZ[�ݏN97\�\�\��\�TqG4�mZ�rf�oJ|�cD�{[��u�_?\�uӟo������\�ġ\����ǲ�ǵ�\��\�ŦzaW�un\���������0qq\�\�\�eKF-XW���z�\��\0\0aIDATx�\��_\ZG\Z\�E��FŞM�5W%\Z�/Q�ߢM�hczI\���\���\�\�̲\�.��<�\\ﵟ6&��y\��:3�\���/_�|��\�˗/_�|��\�˗��\�.>��{�8\�\�qxThq��\�P�\�\"�\�g\�&\�o�_GL���$y62���8b\�b?2>�]���\�\�\�ɕ\��̸\�\�\�AfGl\nws\�NM�M\�ѻkl�QX�Fw�E;ȋ��\�\�xx�%��fEf`\�\�i�Gohjv�3��\�٩ί8g�\�>��\�`\�d�ރ\�Lb)tMδ}\��V(�6�\�,\�6塧��\�v\Z�m�\�\��\��=J\�\nbXGi�ݣe\�Cl4k\�=\�{\�4��\�`z\�>\��\�ƿ\�^|\�(�\�\�\�\�\�H�9t�0J5�0:��\�[TJU�rQO[�����G=\�I�U��\�Q��w)<\Z�vo�>��x��2���1��8�\�\�ÿ�;\�\���\�P_�I&t�	%���;�J�\�q��(t�q	�\�r.��,EҔ�~V\�!l\�\�و\�\"\�4\�tS=\�\�WE\�\�\��\�\�:g\�\�\�f9��A�L*��p}ɚF\�Z}P\�j*KcQt+\�*\ZF�[cפ��\�R�<Ǒx\� �UT<a\�>�m\�`Z�(\�Xq-�9R�p�G6X@\�\�91�U��\�19�9\�r\�\0\�\�\�x\�bS{4Tb�P�&\� 3�o���\��i��\�cT9���6�or-Q\�\���)[�\�\�\�b\"�9\�ɹ����cŀt2�+{{{)\0���\�\\�**\�Xk\0��R�&��\�\�#\�k�@�(��V\�!X\n�\�Q/\�VBb�p\0\��`\Z�\�f\�\�-)\�*��r �\��\rA�.ҙgu�\��q\�s+1��Ar�\�q<\0\�ٳ\�\�j����$�\��{V��\Z \nL\"ڽǑ��6]�_�\�Z*�h\�[�\�%�h\�\�P\��\\KD�E\Z\�\r�\�7[�u�\�\�1OoT�U�,VI\�\�D\��\����\��D̤�D\��`0S\�\��F��\��@\�U�������v\��ʅl{m�\�򖁅W�L��l\�P�F\\��{Yޔ\�\�[�O���#�\�`CŴFYl9l)�iI-TH,�\�\�{���VIЮb�@�oR��=:�J\�gI5\Zj\�PKG�x�-\�\Zi��\�\r:UL����V�^&3���>n\Z�<��p\�\n�\�\�=�d\\@\�d%,\�!oac|\�aU\�\�\�#ڔĻ��1�{V\"�,�ӥd4\�0B9I�)���Qa��\�p +\� �\�\�5rVbs\�\�f\�\�|f���M	v�V�\�r �o����� ��N�3�h25\��ʟ)�J���>+�\�m\� ��H pH�xG�m�w\�|Y�nd\�	nC�ͬ�\n� ,mArH/\�\�v�vhۘ:4F�|�m\Z|�\�˲�\���=�\�Q[���\�F9L���L4��\�\���IK:\�1\�0�g�ҩ7%s\�4O��@��\��\�A\�/0\�E��\�rh\0�Z��\�{ut4i\�(��\�ƣ\�?/k\�\0\�q$r\�DD\�:�\nw��ѠD7G-~�\�7+\"&h�{JC��\\\�o}��\�x��s\�\�ɳ��U\�Y��Af.�X�AY\�b]]G�F|���5�%h*� \�_� r�W<�F\0\���`\�HU;�z�.X\r\"��\r�O]�~�^G�2�rO�$�8\�u�[�\"�	�/\�ȾQQ7�F�o�\�L\�}\"X��IVD\�\�с9&pkt� �wЀU��~��H@����DM�\�T�ةU�\� 9\�[. %^YJ�\��,쌤\� �\�jWt�$җ\�\�ˢ��x	��\�1\�\'gB��w\�mO�Uǀ��uq�Tf2gy��7�:�u`�	m\�\��\�r�,�^ͮ��M\"q��8H�^Sc��\�nN:NO�k`鵒.�/7��@\�W\�^K7���\Z\��6˄�\\ue.�\�_\�3e(`/9�Y��ԫ�i�j\�4A\"Z�Zm�� \\rm�\�\�E�\�\�o�T\�\�ܬ\�_Ւ}q��+�\�\�J�\�;S��s:�(:�o��kJn�;c�W��n�Ќ$AЫ��\��\� ���+���q�*i\�\�_�{r\�\�\\N\�\"R\"�/ss[:\�YE�/ݐ쒩\�݆qЊ\�9�DI\�%���\�V0t\�\�]Q&Z�\�[,C�\�\n�\�߆\"�`��$S\�\�dZESһ��wTm\0\�\�\�+Q��\�%\�\���\�\�W���\�#\����4�Vѐ\�fh(0\\\�\"�-�i#\\i6J\�`W\�\�\n�ЋaS��\��\�I\'\�\�x{%�wuI�H`\�\"�M\rݼ%��7��\�]y\�YUx\�&t�\0\Z�pH\�,aeJ\����Z��0I��;\�$\�@��n�5B���\�>@��\�eN�\� \�(���\�!S77\�勺\�|}�I�w|\'@\Z��\�\�\0\�\�\"\�%7��\�\�\�Mo\�\��Dc\�E\�\"\�$W\�\�\\ky��S�n��Q�i=��\�|%�]������6\\��ux����~Y`��\�� \�Ƕ�\�OlmS���I_�*��<s��\������\�c\�\�GNϩY򢭗�\�s\�-�~O\�q��\�\�\�?m?s\�\\L��L{=\�v\�\�4.\�͹\Z\�9\�8>]t\�Ϗv��\�Ο\�:e.v\�\�\�<]�����1As##s.\�\�S�y\�\�,�u�O;�\�\�g\�X\�w\��\�\�-6\�\Z$�\�ۭ�(*�\��{5g�\�7\'��V�\0\�[�G\�Y�\�mW�ݾ\�z\"���Z\�]�줪\�@\�\0\\�\\Nm\�Sv�k���8��\�<k=\�Rx�\�R]��\"\�b:i%*s�1\r\�\�qn���CU�\�rs�8xμV�جV|䡋si\�B�\�\�}\�D��t.\���c�\�\�\�q\"N9xفc\� .�^�xqQsY\�)����S��ەC�\�\�9u�KG6\�w�\��l;��.K\��*\�:i\�8a�>��N��:k;�-���\�\�\�n�\�\�9�����D=��G��^\�?T�X�p^1ȼ�\�\��1\�Vb!\�ÉR�H��\�\�A\Z$q\� G�\\\�B�\Zd\�r��Y\�g�\�\\�cr�\�\�$�y�\�\\�~�u��~p�b�A�:G�.л�u�]<\�gV�;Jz����䜃��l�nij�`s�\'?\�G�\�\�\�cvy`��[��Rk��˓A�~�\�Ov��>�?0����\�]\n@\� ׏�$���p��\�?Tw`,b{\�:=\�#\��E��\�d�m.Ծ�D��\�O ��○~b0ݳm\�K�\��ӿ\�Wk��V�#t\�BA\�ٖ(\�\��M`\�-�[k\�\�?�\�\���	c���cW=����\�/�mPJѯ\�h���w�4��\��v4[\':\��h�N�8q񽦟O�ώN�O\�\���\�O�O���\���\�\�g�|,�\���:���\���B0	P\�\�\��\�\�\�+���i�\�/�J�vww\�w.��\�O��0�>J\�\'N�[\�>q/_�|��\�˗/_�|��\�\�W?�_i�\�з@R\0\0\0\0IEND�B`�'),('xebit','12345678','Xenia','Biti',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\�\0\0\0\�\0\0\0�\�E-\0\0SiCCPicm\0\0�c``<���[\�$����WR\�\�������A�����A61���7\�-�����8��8��(�|�\���/\�f$\�̝\�`\�а�֡D�q\�R�>��3%�8���\�C|rAQ	#OyI�-��� R\����b�C\� v�V\�\����������\�NBbC\�\�\� w\'d���V��hggP@D?���\�(v!�����\�s?B,i\Z\��N�[1���ێ$��A�\�b``�a��8�����\�$���O\���\"\�$�d��U\�hf\�\���\�l\�-\�\�,�,F<E6��4���Cg�ٜ\�\�{6\�\�7�\��\�O\�?���\0G�d呗G�\0\0 \0IDATx�\�}ip癿�gz�{zz.\�BB�@ 	cN;L�Mllsċ�؛Z��Z�+�Jj�O�յ�U[�\�xW�\��8�\�066q�\0斐\�5\�h4��1\�s�~���\��A= 2\�\�\��|�$\�\��v�\�\���\��P^�������	��\����7��eڄ.�\�R�;HYG\�R\�R\�Ѳ��u�,\�.e-K�KYG\�R\�R\�Ѳ����#_y\�ɞg�\�7�|}oY\n.e;Z�b�����إ��e)v)\�hY�]\�:Z�b�����إ��e)v1̏NV�:9\��Z��2�~0�LE麎��O\�NQM\�4M\'	�\�d�\�d&�1�Lf�\��4�L�,)�\�\�/V����\"�H\�n�Z)�J&�\�t\Z�e\�d2e2�t:�\rĳ\�MGK]�\�$�\�d2\�4\r%��뺮\�Ph�\�dJ�RE�\�f�\�^QQ������e\��K�%�i\ZڏSY,Y�u]gY�a�T*�L&u]\�\Z���u\�\�M��2\�\�z�f�v\�l6\�P�R)\�%�\�b�@E��\�_�\�\n����i\�j�\�\�	ϟJ�p\�T*��*,%M\��/�f2�L�R4M3\��|&��*c\�X^S=S\�w�F�J����f�4��C��\r:����|>Qo޼9\��i�v:�������\r\r\r\�\�\�\�\�\�\�\�\�cccN��\�8UU)�bYVӴh4Jޓlkj6���o��\�\�����m��(V�\�f�Y,M\���\�\�\r\'N��D\"0�4Mg2��>�L�\�f��`5i��\�l\�=�\�C,hmm�\�\�f��\�y�eu]�e9{�\�T�\�<ݡ�����?�X,\�m�\�cK\�u\�n��B����\�\�\�\�\�\�\�ׯ��􌍍\�\�\�b�\�8\�f��L&M\�TU5ڋS�l0b�t:\r�S%�Y,����իW/^����\�\�t�,�\�\�I���`&�������;\�s�\�\�0��\�$ɲ|��徾�.���J�Ĳ�\�\�\�y>�,k�Zu]WU*\�0�����(qH̔��~����b\�ҥ<��].WMM�\�\�b&�N\�[5�Ly�O% e�\�\�i��\�\�񞞞�g\����\\�rE\�4� v�L&���[7\�$9���CM9�#�+�\'\�x�\�\�͛�r\�\�����eY|o�?�{C5����O�P%\�2˲&�I�$�\�Vk$\�y^�h4z\�ԩ\�?����7K�\�t:�NY�3�\�0uuu˗/\�\�訫�E^)�$�R)�\�	s��\n��\�:\�0�^JZ�q:\n3\Z�&�I�˕H$�\�\�Y�DQ<y�\�#G���EQL�\�&�	V�P\�DV\�ӆ���K�.\\�p\�֭�XLQM\�p-f�9\Z�\"\�\"�\\�\�l\�4� \�ϣ|\�t\�l6�|���*�\�\n�\�S����\�W��z�\�\�\� \�0� `;.`�G�$��TJ\�d2i�X8�[�h\�\�/��dɒH$�H$\���\\.EQ઒�I��,>��\�\�D\"\�\�Р�\����\�\�(\���o��v(�\�l,\�¿$\�\�B=f�ł\��-�ɨ��iZ:�v�\\\�<�̶m\�<�,˚�ɲL\�(+\�\�\"����o���,�\��xΟ?�\���\�N�r�\�v�\�f�UTT���\�$<\�B\�z�1 u/\�s&�	J\n�\�\��\�G˗/�\�b�?)��N���Bte�X��%$\�8%9�#G���\�?�\�b\�\�͊� ��:�)�\�Q�F�\�j2�H\�)�ɐ��A�\��\�\�~w�\�\��\�d2��F\n��\�j-���R\�Q�\�:00�\�;\�|��\�ǹ\�n!9�K$�\0��C\\\\�|$l!�.��pB�k2���*��|��_|����\�y$hqEHfd���o��^�pa�\�\�.\\@D�\�$R�4M�\�>�H� \�DlN*�ĹĶ���,\�\�t\�\�px<�W^ye\�ܹ555�DBUU�e\�π�>522R\�5�ruv�\�\�\�l6�\�\��\�b�\�㕕��x��\�ÿ�կ&<4\0F�\�d2�,�N�� �O\\T��\���\�HX\�D�V8~\�W\0\�d6���\�j\"�d�X`�j\"B\'i�	\�\�p8�}�ٍ7\n��\�Ɇ\0E\'���B����$\�f�XAܿ�g�}�Ō\�C�}\�s�$)�L\n���,����D\"�F�Qr�\�MMM�5	�PUUQ�\�H$\"I�$I�@���\�\��F�Q���Zr:�\�{	\�\��~\�dR�\�T*\�0�R�~��\�\�w\�؁�\�j�\�b1�a�V+^$���6e\�\�(�	�\n�v\�\�}\��EQ�}�\�\�$�\�d\�y^Ӵx<n6�Y�UUU���\�Ϸ��=�\�>�`kk�\�\�D4��\�Ē�\'*r\�&�)�L^�r\�>�\�/\�\�\�\�\�\�eY&\��F\�:�\�\�9�t�a���!�ǳu\�\�g�y���A�e\���&	\\l\�$K!e\�\�(\�0�DB�@ �\��\�СC��VVV&�	\�Ce6�aP\�2L&�~�\�\��\�ﯭ�]�b\�\��\�߲,\�qM\��D�J�����\�\�0�,S�T(�\���Ͻ{�j�\�v��͕���_h\�-\��	\�o�\�)�B\r\�\�۲eKee��i0��,�L��I>��Ɍ\�Qd\n\�\�\��\�\����﫪ZSS�i��F\�\�\�3\�0\���8˲�V�X�iӦ\�˗�\���	Ɣ��q��$;�T+�48�<\�\�l�X,��}�\�<��$IPJh3,:�9~3\�0�`���\�\�\'�ܶm[]]�ZDZı.�:��\�Q\�L\��޾}�R��\�\�I�\�9z-h�F		Q��(��\�\�N�sɒ%�?��}�ݗJ��@:�^�\�\"\�\����D�Q\��Q(��Q�(��(�g\��L���\�l6_�p\�\�?>w\�\�\�M�R6\0��\�L&�E�Q�a6m\��\�/�\�n\�z�Y�\rx\�\�?�\�\�?�q�\�pW�ۅ�]G�\�\���:$\�rMM\r`A�\�&<\n\��\��<\�\�аjժ\��\�g�����ò,pDg��\�u�	\�\�ʲ�>R�͆�R�*�\�\�\�\�V�0���������v`�EQ�\�q\�ft���F���WVVF\"�\�g�Xjkk�I��谄\\\�kG<�k׮P(\�\�܌`�\��D\"a�\�$ݞ��+�\">�v\�\�\�\�N�ٜH$E�\��F\"��\"\�$q�0<����\�Ka\�pfl\�<\�+���\�_?~�ܹs�@\0��a�\�0(8\0/\�\���߷��WWW#)\�qv�R�G�q.T_Q����p8�\�\0}BǏ����[\�@\�.�\'g2M\�8�C5�\�@3dY^�hѶm\�x\��\��ǧt�FH�(�_}�\���ϝ;�\�d*++\�fs p8,\��a�Ng,3�a$Iz��ח-[�L&EQU\�\�v˲\\J�\�R\�Q�����\�t^�r\�?�ioo\�- ��<9<B\�+�T__�\�\�ؾ}�\�O?��M\�4,ˆ\�a�\�Ǖ+Wv\�\���\��3\��p�A\�d2���\�0\�y\�\�\�n\�7\�\�ꆆ�\�\�\�FFF����k�G1�G��l��#݈\�\�n�ûw\��裏x��]AIk2	G�u�i���wɒ%�\��\�\�\"��J�\�v{�\�_UU���(655=��\��\�\�ի\�\�Â  B\'D)�7&<��\�W�^�X,�/v8h7%\�%!%��د�V\�u�\�����\�o�6�݂\�\�@�u]�\�l(�\�\�~��\�ꩧ,�\�\�C�\�\�i�f�X��G^������\�q\�\�\�M�\�\��&�I�a�\�i2�\�n��3g����,Y�\�8�E���$J^G\��\�0˲gΜٵk\�\�\�hmm-bX��e�\�i��P!\�3kkk�\��h\�\"�\�*IR6\�RqO\0\�\�l�d2�F9�koo����z�$o��2Z\'��\��\�\�={��DQ,-HT\�\�(˲�,sw\�\�u\�\�\�Z\�-o\�衲p\�t]�\�b4M�Y�\��\��>\�=$jF1F�B\�����\�iY�\�f�\�\�(jddd�\�ŭ����\\�~=�L�<��ٸ]�\�\�y>���`��\�\�\���\"��\�Q솉D\�رc�|�	M\�,\�\�b1�\�\�Z��(v����z\�gV�\\)I*�H\�\0\�\\��y(�e2�H$�i�\�\�\�4������.��;v�$	�\�4Mc&\�4\�\�\�UB	������\�l����ݻw���y<���1�\�u�u!?�ʂ�\�\�ŋw\�رt\�R�\�Kr�(\��$�\��ZR\�7P�{�H���n�\�\�\�\�\�}}}HT\�80Ѩ&�L����������f$(\�\���\�h�F8\�dY�Z��@\�\�ɓ�^�#!�q\���D7x6�Ph��\�?�|[[\n�$}�R���.#A=*��f\�\�d2�`��;vttt�B�D\"!IRUU������Q�K�.}�\��,r�(\nj�\�p��\�d\�\�h�\�V8<\0\�z��v\�ލ\�9�l!*\�x�\�������\�{nժU~���0��\�0���,�|�\�\�\�P(\�0�\�fS\�\�p|���V�9Td*\�̙SUUo>�Nk��$1A�/�V)�#�~#8�@q�N����\�\�\�n�\�!V=I�\�t:{챇z�\�y�\�P!,	A��\�\�^�n\�ڵk\�nw\"� \�cD\�(��tww�\��\�\�v�8�������L\0M\�X���\�O].z8�V+6;��	Ԋ��x<�~��\r6�\�摑�\�x����~%�x<\�p8�.]�v\�\���q�\�*5�p\�¦\�i��c�X&�q�\\�T\���\�~��a�h4�J�_\"X,��M %��4M�\\.\�t\0:�;|��\�\�m\�U�l�����I\�k<ohhx��\�a�Q�$�\�\�w�/�eY�Ţ(�$IMMMO=�Tkk\�\�\�A����H��>A\�\�Ǝ9�+v�bf1/ņE�\0	���}�J�N�S�eUU�N\'`�\�\�\�d2��Ȳ\�m\�\�\�\�Е&�\�s��P�B���7oގ;�~?��DQ�\�l�Z~9\��	&�\�\�p8p`xx����`�r��\n+%���LTrąbY���\����(\�\�0	(&�`\�֮]�\�c�\r+�RM	��\�\"\��n\�#�<�aÆx<��\"5�eEA\n\�5�L\�\�v�\�{��a��r�\�LH���8�\r�4\��\�[n�;�J\�\�\��A� H�D0v�\����\'�\0i\��@��˾8\�Ǆ��.\�F\�H�\n��s\�\�h4*I�\�\���bJ�����,�\�y��q\�ߩ\�\�7�Г\��\����	�\0V\�}���A[\��\�\r	T�\�WQ��6QW!�\r\�o��O��NV���ft�`\�Ò%Kv\�\�)�\"\Z�Њ��|\�H#%\�\�\��駟��E\�O���zX2v�B�T*�{4��\0\�˲\�\�յj\�*R���\�z<߸q�\�\�ahh.�\��h�p\��\�f�!�_�R2:\n/ƀ�(�\�w��iA��G\ZA��(+V�X�pa	{\'+Pǹs\�nܸ{���9\�\"\�N\�ϟ��|\�k/����\�/\�\\�~����0�%�\�)�£���]�l�ӻ\�\�$\�eY޸q#\�q<\�\���\�\�\�ǯ\\�R]]�\�Ý\�Uߕ����\�\�Ӿ��\�\�>>j�,˦R�\�˗����\�4�K�>\�yPmm\�5k�~?\�<����===$��\�%߭���f�\�C�еk\�l6[�g\0>\�T*Ųlgg\'J/\�\�f�\0@\����\�ˡ9b_T\�R�\����\�\� �\�ř\'.%i�\�\�\�\�3::z7\�Z�,ϝ;w\�ܹhR3\"ҙB\���[ZZ���\��x\�8\�S___oo/|�\�,5����R)\�h?rF9\�5Q�G�ҬY�h�v83��\�H\0��iz|||\�ܹmmm52����\�p8�C�؄�l�o��F\�\'�\��\�\�\���\0R}l�\0\�p8\�\�ہ@C/r�\�;�%�!�\"IR[[�P�_ �@h6��]�666VX@f�\�R2v�p\'w\�d2A�E�PB��\�\�3\�4m�X\\.�\�\�\�\�_�[a6��^(Ng��tFL�\�p-i�ퟮ\�uuu\�V#��i\\�J6�\�j������\�q��/�\�@ �H\'0��t�� \�\�q\��\�\�x\�\'���<�uf\�QBT\�\�nwMMM����9O�\�(����b��(��5��23k\�,t�\��3���\�\�d�\�C@�V<�\�\��E%%��P\�T*�Ő\��\�\�\�t:m�Zkkk�{ӻ\�i�Q\0\�\rz�1%*�Pk\�I\�7���+)\�5	��@�>��u�\\�ɶh�y�,\�s|\�v��\��-�\�\�4\r�Ӳ̓\0+Ij���z搩4\�Y�Η�\�f�4M\�\���\�:�H�4�L\�\�J�NG��d�/�\�\�\�((�1\�\�\�<��666rG\�\���\�w%\���n�\�FX\�I �w\��\�&�ey||�(z�I\�\�h��p\�\�T���^\�T	�cF��Vk\\X	Ɍ\�Q M	���8\�D^\�d2�w��m\�sR2cu\�=��w\�U��\�>p�h��&+3\�\Z\��i�G>���^Wd\�\�Q��\��\�-��௜X\�kG�\rKt{���^ڔ\��3a(��[3֎��9T2ó8\�(y\�Gq��p\���螙Q����TVVb\��a�~?�aƻ���T�hR@���X,�ad#I�\�|�\��b\"B�����\�Q#�f\r_3������\0if\�GA��1�%�L\�\�\�	\0�p\�e{E%���$5��hn�\�$BLwE3\Z��\�H�\�Nhv\�\��D��\':\nt�\�\� �\�]�]I\�<3\�w\�0��\�\�\�Q��rb\�(�\�L��x<�\�P\0����p��\�3#P	�\�M\�\'\�؛�\�\��z�\�\�ʯdS�#r�\�$�\�u�\�y�\�U\�\��T!�\�\��*�\�ｮ\�^�C�fL�k$`�\'sHb�X\�ڰ�0����9P|��\�Q�aPmw�\\N�f5�\�Q566�lf\�I\�DP��H$����~*����\�MjRX)%�\0\�q6�� ͌�GZ4�����6��5.IR(\�q<92�N�@t�q\�w+%��\�E���j޼y\�h\�%�\��\0FGG���DQ�\�=\�h��\��bQI��_�\������%���\�w\�����\�\�\�\�$\n�(�dt\�\�г\�\�j�Ӊq9>#q\�\�%L\�J�Rd�\�\�tz\��\�\��\�\�^EQrs_bkr�\����d~\������\�4��$@G\�̙SWW*�㱿�\�\�s\�΍���\�xz�<�BrOEy�ޞ�P\�8)�����s\�]�	��\�QR\�\�u}�\�\�\r\r\r��\��`X���|�/_�h���tA�/\�ŋ�� ˲��\Z�����Y�f\�\�6���\"��\�\�3g\Zɍ�\'���L櫯�\n�Bv���\�|	v	��8}���iv�=\��!�T[ZZ\�v;~.έ�dtA+�P�h\�\"�ә\�N\���r\�\���\���\�%O�2�˗/_�~��\�8�T*\�6\��\\�鹒\�Q9SU5�Htvv655守\�=�L�cǎ���gL��F�B��>�3\��D�\�E�^}}}GG^��-s�\�3\��P?$����\�\�\�\�|F����\�Ν.\��J^3T�~�ɓ\'���qVF\�c[������GN�hqa�\�Q�|\�T�K0pd2�\��w�wgϞ\�(�T*^\'\��\0g�\�	��(\�;＃���@�N�h�\��N\�m�w�\�3\\\Z&M�X,E�\���]�$�˅R\'.Y�?_+\��k���\�J&�\"\�Q]\�KɎ�8�6�mӦM���d6R�dn�E޻w/@h��\n�\0:�\�JKa�σ9Ӹ\'6�mϞ=�T\n\�!&Oc�\'\�	/�\�\�[�~� dz�B_\�\�R2:JPg�����;wF\"8^x$6�\rx3@*��,\���={����!������TV�G�����\�ݑH�|\���Xw�B0��Tj˖-v�Â�\�/�\�M,%���y�M#�\�5k\��~�œ#\�~�-�eY�a���v\�\�%��\�n�\�b`\�e��z|1y��(�%\�޽{���:F���7\�&	�EEqٲe�\�?A?��-���	�dt\��3l^���\�sϡp\�pp�1Q˲�>q\�\�d�����\�l\�PHԄ��\�O>�\�\�pp6n\Z�ȈQ\�ٺu+\�0`r����B_\�R2:J�\�,����(�W��={��i�Ƅ�=\�S\�(*�`�\��\�\�\�\�\�r�TU\�4\r\�]�����}�`�\�͛{�\�D\"�\"\�7\Z�\�0�LP_�`�\�?�\�Q�ˎ�\n}}H\�\�(�(�\���H$�N\�\r\�v;\�c\�aE@�IN�d2�<\�\�׷��\�\�^p͕fo\Zvy���]�v\�ȑ�/\"��I�/��\�[��(�\�TUU}�\�\�F\n\�\�-\��P2:\n&G\����\�0�7n\�(lR�\�nM\�N��\"�ѣGO�<\�t:��\�bŹ\�M(Hb�S���3gΜ8q,�f�&QRm\�n_���Z�z5�q��8m��o1|6\��J�L\�\�\�4�Ś��֭[766&IM\�6�\r͸xr(\�}\0\�\��޽{׮]�G(�b\"�@h�\�Of�9��O�-\Z\�gL��\�	�;�\�jE\�\�vWTT:th\�޽�@���\Z�8Rox�ʲ�m��\�-[��\\�\�V\�l4In�%cG�\�l6G�\�\r6�^�\Z$\�C3n?\�j���~�˥(\�o�q�\�Q�\�%�\"M\�N�\�@mm���>�����\�T\�B�,�Rt�\�E�\�\�~�\�{�AA�\�c�XdYƴzEQ֮]\�\�\�^\�\�K��\�\�?�q�\��\'�\�fE���Q\��˗/�\�!*QS27A˲��������\�4\�\�\�\nO\�B<�l4\Z5���\�ޠ�L\'��H&u�;\0\0 \0IDAT�UUUv���O>y�\�7���9�\�t�m�8��x���\�^hkk\�\r+6)y;�J��	�B]]]\��ַ�\�\�>{�\"*�2�,\�&�iΜ9׮]�\�/~�\��\�\�� �q�\\�MKe�p1�q:�f��\�ѣ��\�/.^�XUU\�v�s\�\�\�t\�\�tf2�x<��\�|g�����E�\�麎<H\�\�QI�A\�4\�\�v{<������q�ө(\n���\�b�����5\�.�D\�̙36����\�\�t�\�a�\�ʲ,�H�\�?\�v+$#�\�v�\�j\�4\��\�\�x\�\�\�ᖖ\�\�G,3z�K%�x\�\�_D~\n�\�)]�\�uNMӒ$͙3\�\�v�>}\�\��\�ݢ�H\�$	d	$I�:����;w\�d2544�\�n��\�t\Z�P~\�T\�(J�\�\r\\.�\�n�~����w\�\�=22���h4�\�d0�\�h=&�ixx���\�G?�Qcc#AB�L�\�u�%��� 466�B���2��\��񺮓P)�d29k֬x<�\�W_)�\�\�\�\��|$�\�j\�M�?\n�.�\����C��\�`9\0�8�3�\�I�d�۷o߾q\�\�lj�\"�ߍ�\�u�P\�� �\"˲������\�:J�G%+l�\�f\�׮]�t\�RUUU{{;\�>�\�\�T?cdvy����w\�9y�$l*\�HX�%%x\�\'<O$y�\�_{\�5D]�����VTTP^��\�k��\�O~288�M\�\�\�\�\�E,��j8���ݸq\�u\�f͚w���\�\0;\�i\0�A8B�O�=���\�\�\\��\��<\���\�l6#\�izhh\�\�ѣ�}�\�\�\�(JhF�h6�a��\�q��\�\�\�\�\�O?�\�+�TVV½V`��0ټ�T\�)�*y;j$/^��|\�<�\�\��x\0�0��}�\�-IҥK����Eihh\03\n	���b�H\�ʭ�!�\�JQ��i��#=���s\Z��(�\Z<q\�Ļ\�{���@ ��,¦{�\�\�e��$I�Db\�/��\����%I\"��՚Ƕ�i�\�g��Ο?���\�\�󍎎\�+\�2)\�\�.�0��(UUc�X \�\�\�L$��\�y2�\�!�\�\��xl6\�W�\'\'E\�l�/�/��\�\�Z�J��@�\�j�z�\�?�\��w\�>u\�\���\0&���(�\��ۥ\�i�3�ϟ?���^\�\�\�i:�X,\�\�\�\�+f���{}&��\�\���\�o�\���\0���Mx<�$�w8�G�)\�\�\�X�b\��\�˛���O�\�p!L&|Yx�d/��\�eYI�4MC&\�J�\�\��\�\�\�\���\�O�>\�\�ݍt�\�f\�;�\�Q�0�᠗<\�S���w\�\��裏��\n?�dI��Nx�\"\�\�g��*��\�\'���׿�z�.�\0a����h\��è<͞=���kŊmmm�\�\�K�R�,��\"\�\�\�\�\�j!\�EQQ�\�\��x\�v{EE�\�\�j^�pappp�Q$P&]\��\'\\<�ӈ�X[[��\�}\�\�\��6b)x\��E��d2I\�&<OYG�Ox��\�b,\�\�4}\�ĉ�\�z������&w\�@3�s\'\�2\\��\"�H<�\�\�uuu0�(\�X\r�qF�\�hπ*S\�p8��_���s\��\�\�\�a�χ5D6ԋ�\0/cCGEQ$\�b�D�Q�*\�``����N�ut�\�+�L\"�o߾�\�{/�\�x(�\�A\"�M$�\'\n!ۏp�\��a\�\�\�-Z\�\�\�5����*h3�,��\�A0�r\�\�ٳg���#�i����L&\�F�\�a����\ny�\�\�槞z\�\�G\�eY\�D�o+��<e�>�e�eYd\�����<}��\�~�3#\�XX2n���\�s��GUU<o2\�C�妦&\�Q8�C��\�\�\�\�X\"�\�d2<\�\�\�@#�8s*�\�<\Z\�\"_�;)\�\�\����\�\�G\r�â(b�\rZ�\�\��6�k\�::}�<!; ?���\�\�ϟ�$�����)B�(/\�Kp�H�h|а�w �#JK$=�П�ٟuvvF�Q`�r�L5>\�Hw\�\���:J\����?˲��\�o;v�n�\��y�^��\�>\�t:���4Mkjj�\�b\�ظqc]]˲`�P|�F�Բ�^�;gk\'~����~�\�o�\�\�ׯ�\\.�Á�^�\�H���R\�t:Y����ۺu뷾�����h4J\�2���΄\�)\�h\�x`�\����\�4\�\�\�w�\��>�@Ŗ��R�&��\����\�\�u\�{\�E���E7=z�!��\�\�R\�\����\�%\�0���={�ȑ#�/_\��r��z\�\�\�ϟ�y�\�k\�\"\�\�2}��dY6b\�)!-\�d�\�ϳs麮#�����e\�@ �f�|}/m �:?\������|>�>�TH@<G�*�B@�ˌ��F1M\�.�kttt׮]�w\�$i֬Y(\�\�{�e?���***�^��민�\�_�\�_��J�aѩ�c\�R	\�\���F��X,�\�o>|2(\�\"�j?\�/x��]J&�\�\�\�n�{�\�\�\�<�̜9s\�f�$Iȭ�ú\�^��xd\�Q�)�\�ʕ+�O�޳g�lv���\�2و\�H\�4IC:�	����c�j�a8���\"���\�l�G}tÆ\r���(Me�98��<Ǩ���)=\�Hf��\��D�h&4`dd\�ԩS����7��$71�6j\ZR=�@_a��\��Fv\��wg7䦠\"O��\0$kKK\�O<��\�{<�D\"�X�̿x\0�/�����d�f`{�X�\�x<~\�ܹ\�>����x޽��I����\�#%\0\�FkTc$\���\�\�D�&\�;��ޢ�X��(&����kӦM+W�t�\��\�f�(��zc{)\�\��	���^\��\�\��իW�;�\�W_�Ap\�`\�%�\�\�\�\��\�{	���\�z`\�Iz���\��\�aG�W��frM\�@4�v\�\�u\�\�=�\���@@�e4\�?�\�n���\�_= q�s�\�\���\����\�\�H��V\�q�\�q\�]O<�I��D\"�o�iڈ^�H\���\�\'��\�\��\�L~\0� �\�%IbY���r\�֭k֬inn���\�p\�\�vcЊ\�Ŗu4��\�-\�2\�[�\�s\�\�;vl߾}ؑ��@��\�f\�\�gk�Q�\��\"�\����F�\�p8�i\Zڦ\�\�꺺�&<\�\�\�P0\Z\Z\0�\�8�\�\rN~bDI_�QI\��\�\�˓eYE�\�<O2�\�4\��\�߶m[MM\r\nQx��\�gYG�/\0.Y�V�\�P7ڳg\��\�\�gϞ��!\�NM\�\"��\�Ŕ\Z\�(\�q��)��(\n�^�TKK\����W�X\�\�\�\�\�\�\0\�h�g\0{�H\�\��uww_�zudd\�\�ѣ0���-\�00\��疡\�\��+͂ ����(�d�z��-z\��\�֮]�c�\"�	\�_\�\���\0�?p\���]�B�мy�`Y\�#�H��0!�\��F:\n6n�e1����sѢE����f\� ZQB!�C��\��2˲\�!\�\�\�\��|����`0Z�	ϓ���\�dC%I2�L\���p\0/� O=�\�/�PWW744dt���޻�<��3к\�\�<�\�\�\�\�\r�<2��v\�\����R)\�KB���*\�>g͚\�\�\�\�\�\�\�\�\�Q__��F����\�d�\�.4�\�w\�ʕ�7ovww\r\ry�^@\�Ȩt;!��\�\�6z�E�9\Z�\n��f͚M�6uuu\�\�q0^���V���:�����j�\�	#P�<\��p�\�\�C�]�x�	\����\�qĹh\�\�3\�i6�\�v{cc\�%K,X�p\�B�*B\\B\�0\��\'���� q\�qC���\�w\�ڵ˗/����AB�\�\��W��\�>x@U�L&|��͛7�Y����w��\�\�d$3YG�;D\��;��\�?v\�\�\�ӧ)�\�-\�[#{�,:⁰>(\Z�Z�\�������e˖����\�n\�ҍp\�	aM��8�m®R/H$~����\�ҥK/^0�LV��eY�ÑL&#�Hv [M)�Bk�ጶ��nݺ����izdd\�\��X,�p8L��w��\�\�L\�Q�\�\�\�\�y�G�\�\�ؘL&>�ӟ�\�?����=\�y�F%E)�R��\�\�յdɒ|����6(\r,&�\�;\�h���\�r\�:#\r\���-^�z����%���y4�L���:@�&̩�K����l\"��\�\�\�\�/���ƍE	V�\�b�\�\�	,\�\�]	�W*��b�|����\���(�\�n����3`W����,wvv�[�\���\�ohh���J�R\�C���\��b�i������\�I~T\�I\' |�@ p\�رC�������,�\0ݲ�\�|ԝ�:��\�\�z�嗟z\�`0�iZuuu\�겎\�YTU����e9�����7�\�8�옹\�k\�£����jժU�6mZ�j��(H}\'�I\�-&�ERC\"�ɳ\�,o�\�\�\�f�8�	J�\�pK@B\�4rR����gϞ=ǎ�\�\�.��\�y�\�o��x��/K&�\�!�>�����\�\�>�\�3d�\�T\�f�����N�\�\�\�O�:�{�����P(�\�\�	V:�S�����c˖-\�ׯ7�L4Mc*3bd�\�\�[pOF�\�{˹\�\n,(HMϑ��`�$&�>}�\�w\�=w\�uoY\0����\���`\�f�\r�\�\�W^ye����oF\�^YG\�,�G,\�;v\�\��\�\�\��xcc\�\�\�(�āC\����\��7oޓO>�y�暚���1UU=O&��\�;@ �>�l\�\�;�QL6Y͆�\�\�>��|%�;\���P�\�?ܷo_vo]�^7v���ЖL&].�(^}�\�;v�|��^g\�d2� ���\�l6�\�� \�e(�\�߿�\��ߎ\�b� �l{S6�8���A\�\�\0\n�\'�xb˖-�/\�@&\�7���Z\�d\��Ts+�\�g?��\�AB�H$�\�$f*��͆l\0T\\\�u�^bW���z�\�\'��D�Q�Έ2\'��<J\�q;r7666{�\�t:=22�OQkjj<�o߾@  �\�\�e�&��\�@\�\�0L8nhhx�\�W��&$�X�œ��0\r���:~\�uuu~�\�\���a��\0��E��\\8�ġP�{]]]Ȝ�N��\n\0@YG�(x\�Ap$��(�\��\�ӻv\��x�\�\�D�	\�۱v0Z*�	\r\�pxÆ\r�\�\�\�\�\�v�u]�\�\�\��I���\�H�\�\�\�Y�x�y����\�\��f\n\�U��o�\�pc�X0��|mmmd�8܃�!):\����q�\�,\"\������\�\�\�\�8\�[�?\�\�7:0\�V�u�\�\�/��\�(�Br�a\�l�|�x��u~$ZZZ���t]�y�f<\�8t pCt]G��k$Q��\�\�h���9s�9Ƽ�ܼ\� E���[\�XeQ���\�ؚI\���ln�lD�\�b	�B555\�?���\�\�].�\�z�r\�\�\�C@Pl:\n�C\�s��\�,\�޸q#�!����w�	�\Z\�4�\�ܸq����������<\�Բ��Q�\��\'\�3}��\��\�\�t����`{{�$�Ϛ5\�{\��\�w��\�A&��Mv7�$&�\�\"\�Q�\�\�\�\�f[�h�\�\��z� \�u�\\�LF\�4 W\�2� IMӰ�h�6::\�0�������H�NGa�r�L�����gv\�\�/��\�\�^6�\�����d͚5�@\05@Q�\�\�$1��I\�j�\�,6\�y~dd�\�\�\�\�P(�\�zss�9sz{{1Q\r-0�x\'�1\�KKJ�\�a�\�j�5kV6j��\�t�&2#gΜy�\�w%IB*I\�B��}\���\����0o\�<�\�N\�4\Z�*@��@��F#)6�e&H�D\�\�\�\�t:�\\��Σp\�q\�#�|�aa�\�\�\�h(jmm�3g<\��N-��@;n)+�%���jll\�\�7\�<{�,�\r\�R6��A<\�\���~�\������\�\� 1;>Efn��ѽe��\�H&�\��M:\�*-^�xΜ9��_�e�Z��x(R���\�\�\�n\�\�\�_�j�VhG\�@�{\�\�\�\�\�\n9w�̻&\�\n�\n}��}���������4s\�\"H�\"�\��z.\\��\�?��\�{5\�+��.[�엿�%\�󣣣\�\�\�ccc9\�ד\�~eeeoo\�޽{\�\�\�~�_D�+R	�j)��7�Ad���Ñ#G\0�\�1:�\�\�E�VKK\�+���lٲ齔���{\�\�^}�\�:�N�f�l\Z8���\�t\���x���ӓ\�/$ovj2���쎍��\�7�	n���9�I����\�/��/�~�iY�c�\��^J�\n\�0~������\�/��\"R�9t)*�N*++��\��뿢���0��\�\�!\�Qk\'lp\�u]?q\�\�W_}E\�4�Cr�wʲ\\]]\�t:�l\��\�#��\�a#�\�7S�էi\�\���Y�f\�Ν��lB!�%F\�	�p\�ĉ/��Y*��\�\�|%\r\0�{\�ƍ�G��$	]�F��\�\�\'�|衇P\\&}e!�gd��V\�ƍ~�\�:\n��?\�gee\�C�0\�\�n����i�\�LGIPO\�=\�d2|�\�G7o\�u&�9\�W��ZZZ6l\�\0�Yuuu:�6\Z��\r�D\"!I6nd\�_z饥K�\Z�:>|0�\�TWW߼y�ȑ#\�\�\�ُ�\�i���\�hv�˲ \��z��}�\"}d��\�\��kllܹsgss3\�$\�\�\���c���j�\�l�B(����>�\�Fǃ����<c~ډ\'����\���:\n7\�~/�\��\�_�\Zx{�\��H�\�lh0dhhh\�Νv�HG\�k�\�M��u1:>_y\�\�~/�Q����~KK\�\��\�\��|>�\�v��\nb\�I�F�F<H��p	\��<��PH;��$z<,ˑ#Gz{{��G�8�\�\�\�\�ݽ}��իW\�\�Ԁ��4Tܑ�,���/��b?\0㸥`٘P\�\�t��\�\�a,\�\�8�sOĳ�i:\n8p`tt4Ǒ(\Z�+�bGG\�_�\�_q�^9dU����\�rIKee\�/�\�\�ى�\�\�\�x��FFF>��\�`0�\�BL9\�R0E��D\�q��y___��\�T\�P\��\�\�\�\�466�I��_h�/\��wQ���\�)�B!dRs�\�P^\�\�\�9{�l:�\r\�\�Q`p�\�$r���\�7�\�N�3\�G�A\�\�f{\�Gx\� z\�\�\�^6RYrH*�\n�\�K�.]�z5J�H�o6�1�رc�$a�\�\�0�\�R\�\��Lׯ_?��\�f\�\�;\�[\�4-677o߾\�F\�B�f�!�IF\�2� 6WUu۶m�\�\�E1�sIR�_��իWA\�1\r�i�1% $IҁP�\�Q�CA?�\�\���k׶�� M$�D\n���{��7�J����֯_o6�\��80�\n\n.\�9p\�\0fLOI��:*˲\�l�D\"ǏG\�=G�\�0��ŋ�[�.�\�l6�vZ,t6�g\�\��^M\�	X��k\�677\�є�8b�َ9�eY��9z���4Ms8~���(\�ᘓ�ٙ3EQ�ɤ �?�� <ϣ\�	m\��\\�T�\��O6\�g�ל�\�[��\�d	q\�u]���}�\�g	��P�#\�*��h4\�v�M&\�[o�\�\�\��o�!\�\�\�\�qsH�t4�L�\�\�7o^�zm���qB�b��mmm�\�\�G\�\ra\�+\�=($I�\�b����}\�ʕ�(f��\�@�EQ�(\n�\n��N\�իW�#\�s%\�@�B֙A8s\�\��\�\�\�\����R\����U�Z[[\�\"�_�����z���\�t���yݺuP\\ԥ��E���C����\�ԩSN���~\��\�A\�zoR0�y��ip^�^\�\��\�S,�\���b@�|�Z�H�x�G	EQ+V�hoo�B�\�#�\"\���U~��窪�<OQ�>�w\�Q0appY4(n�[\Z\���ɴr\�ʦ�&f\�+��\�0��\�ɦ��u\�\��ÉH;.!A1)7zzz0\�u4�\�\0�ߛҎ^�t)�Q�4+��Ŏ\�\�\�\�w\�}��#�:m�43R@\��=(Y&�\�\�\�jjj�9$MK8\�D�̖$\�̙3\�y\�D\�n�`:\Z\n�.^�=\����|B��������\�+,���,��h�@�D\�\�\�-[F$�w|��\�<#��/_F/?49\�{\�C\�Zj\�5)���CCC �E��p\�v�-Z$�@�Q��\� �x��f�����xs�G�	\�$\�\0H`�t�\�8�\0\�w�S��$TO&�\�ƍ7�D\"�ef�\�C��\�\�\�\�ׯ��b\����\�\�7y�\�+�jt<Ɗ�#\\�H$\�\�\�\�\�҂� f�H�|�+�4�\�600p\�\�5�m0�NG�\���`S��ُ�4\�a@ �\�#��\r�|\�,6�-����f��\�\��\�̓eA�\Z\�^�\��~��(d�)\�\�㒦c�\'3�	\'�$I===�9:\n?�lÔ\��\\�f̈́\�j\Z�M�\�\�\�ى���\�`\�\�q�o޼�FI-\n�oI\�(\�MӁ@`pp��4P�@D\�}	�\�MMM,������y�T*\�\�\�RWWG8u\�4bt�\�\� P\��\�#�K�&\�O��CCC(�\�W\�aeᰣ��N�\�\�\�V�\\I����!eS:�As\�\�E%�9��P(466�*(\�\�o�t:t�\�?l\�d�����\�\�\�\0��\�L&�bŊl��[\n�Ӱ�o�X�\���\��C�ČV\�\���.sl�%3�ikD�4M\Z\Z\"�A$6\'\�+��\�u�������\�hn?sY�+H�̝;\�p��\�\��T*522��\�xL�R\�qI\�dG��\�K��bpRIٍ0eVTT444\�\�vD����ʒw�5��������\�\�x]\�\�\�0!}\'	�<.i:�$s�ۓ�\0\0�IDAT\�DOOO(�80�4M�\��FUU�\�AQT8^�b�\�\�DO-Qe�\�EX�l�r�\�\��q������#��R)@\�o�� f�9�B!\�!�(�$S�rt]�N���M�q�h��X,�\'kR��\�ڌq�$imt<p�$E\nW�\�\�h��ǿ�X��\r\�DӉD�\�f\�\"\���L��<\�d2\�\�\�cx\�uT\�h4Jt�[�\�3Nk��B�P�Y8�!\�\������H��\�H����	�\�\n\0T0D\�Q�v4;\��[(ʱw�A�L\�\�tVVVNFY�v*����\�\�rt2��!\ne\�\�\�Q�[�DU\�p8|ǽ\0M��G��-\�4\�\�\�d\�\�p�@�\�ܟ�F��1�X\�L\�B�4�90\n(܃}\�\�v\�%*\'��SP^\�yٕ\�+6wI�����!\�ӗ%YTUͱw�p*�\�yY�r\�4m�\'�N�1�\rI�ܹ!�C%�\��ڔ)��`�dY6�a\"���\�;�\�<��(\�O�R\'%y�ϔ�MN�։\"�bcc#\�W�\\.�u�w#�\�\�\��\�\�FPAe��D�(j\�<C`�ړ\�	�\'=�x#ѦXl\n:���\���\�\�y�x\'<\�\�t&�\�H$B��\�\�#\���?{�p�DB\�uEQ�\�(��	�ǽ@,____]]d�,S-�ʠi�\�jmnnFϓ\�\��x<\�S\"�p8\����\�8\�:��CA\\.Fƣhft\rV��\�y`m8�E�\�^gY \�U\r!\�t\�\�p\�l6#z\"�۝J��b��,˂ \�wIS��<ϓ\��ɫ6\��4M�AI�\�n7\��g��%�\ZA@�\�\��dt<pk�|�\�ddY\�#\���\�(fb:w,�D\"�����O:�F��9b��\�W�H\�4\�\��E\"�\�r\�vh\�s:��@\0=�y\�g��^oOw�\0��+���8\�\�xDTD�c�Xv\�}�\�L�\�Q72�L6�\rl�n����V \�yևa��\�̘r\�4\�\�vc�XmQ�7ھ�@	�H�[\�4Su�\0\�o�VM���J���F\�)���L��\�T��n\�\�\�����\�yR��\�R\�R\�Ѳ��u�,\�.e-K�KYG\�R\�R\�Ѳ��u�,\�.e\�[�e��Lu�\�H(�*\�Ѳ��u�,\�.e-K�KYG\�R\�R\�Ѳ��u�,\�.e-K�K9?�g)\�2��\�y9O�d��G\�R�?E\�:Z�b�����إ��e)v)\�hY�]\�:Z�b�����\�%o�Q�W#\0A�`�o�,�B�8\�RX���\��ᦟ\��5�\0\0\0\0IEND�B`�');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-07 16:41:54