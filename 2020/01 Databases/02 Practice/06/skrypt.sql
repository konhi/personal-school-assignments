ALTER TABLE `dostawcy`
  ADD PRIMARY KEY (`id_dostawcy`);

ALTER TABLE `towary`
  ADD PRIMARY KEY (`id_towaru`);

ALTER TABLE `towary` ADD INDEX( `id_dostawcy`);

ALTER TABLE `magazyn`
  ADD PRIMARY KEY (`id_towaru`);

ALTER TABLE `dostawcy`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `towary`
  MODIFY `id_towaru` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `magazyn`
  ADD CONSTRAINT `magazyn_ibfk_1` FOREIGN KEY (`id_towaru`) REFERENCES `towary` (`id_towaru`);

ALTER TABLE `towary`
  ADD CONSTRAINT `towary_ibfk_1` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`);
COMMIT;

COMMIT;