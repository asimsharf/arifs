FLUTTER = flutter
RM	=	rm -f

all:
	@echo  $$(date +%Y-%m-%d-%H:%M:%S)
	@echo '(1-	run_safety	).make flutter run.'
	@echo '(2-	get		).make flutter get packages.'
	@echo '(3-	doctor		).make flutter doctor -v.'
	@echo '(4-	upgrade		).make flutter upgrade.'
	@echo '(5-	devices		).make flutter devices.'
	@echo '(6-	emulators	).make flutter emulators.'
	@echo '(7-	launch		).make flutter emulators launch [ i=emulators id ].'
	@echo '(8-	create		).make flutter emulators create [ i=emulators id ].'
	@echo '(9-	clean		).make flutter clean.'
	@echo '(10-	zip		).make call (9) & remove zip files.'
	@echo '(11-	backup		).make call (10) & zip existing dir & call (12).'
	@echo '(12-	history		).make cat history & remove bash.'
	@echo '(13-	scp		).make deploy [u=user, h=host ] & call (12).'

run_safety:
	$(FLUTTER) run --no-sound-null-safety

get:
	$(FLUTTER) packages get

doctor:
	$(FLUTTER) doctor -v

upgrade:
	$(FLUTTER) packages upgrade

devices:
	$(FLUTTER) devices

emulators:
	$(FLUTTER) emulators

launch:
	$(FLUTTER) emulators --launch $(id)

create:
	$(FLUTTER) emulators --create $(id)

clean:
	$(FLUTTER) clean

clean_all:
	make clean && $(RM) *.zip

backup:
	make clean_all && zip -r backup-$(name)-$$(date +%Y-%m-%d).zip . && make history

history:
	cat ~/.zsh_history && $(RM) ~/.zsh_history

scp:
	scp ./backup-$(name)-$$(date +%Y-%m-%d).zip $(user)@$(host):/home && make history
