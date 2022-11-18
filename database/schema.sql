set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "public" cascade;

create schema "public";

CREATE TABLE "public"."users" (
	"userId" serial NOT NULL,
	"userName" TEXT NOT NULL unique,
	"hashedPassword" TEXT NOT NULL,
  CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public"."deckLists" (
	"deckId" serial NOT NULL,
	"deckName" TEXT NOT NULL,
  "userId" integer NOT NULL,
	"formatId" integer NOT NULL,
	"isPublic" BOOLEAN NOT NULL default false,
  "createdAt" TIMESTAMPTZ NOT NULL default now(),
  CONSTRAINT "deckList_pk" PRIMARY KEY ("deckId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public"."formats" (
	"formatId" serial NOT NULL,
	"formatName" integer NOT NULL,
  CONSTRAINT "formats_pk" PRIMARY KEY ("formatId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public"."cards" (
	"cardId" serial NOT NULL,
	"cardName" TEXT NOT NULL,
	"cardCount" integer NOT NULL,
	"isSideboard" BOOLEAN NOT NULL,
	"deckId" integer NOT NULL,
  CONSTRAINT "cards_pk" PRIMARY KEY ("cardId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public"."sideNotes" (
	"noteId" serial NOT NULL,
  "deckId" integer NOT NULL,
	"matchup" TEXT NOT NULL,
	"createdAt" TIMESTAMPTZ NOT NULL default now(),
  CONSTRAINT "sideNotes_pk" PRIMARY KEY ("noteId")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public"."sideCards" (
	"sideCardId" serial NOT NULL,
  "cardId" integer NOT NULL,
	"noteId" integer NOT NULL,
	"changeCount" integer NOT NULL,
  CONSTRAINT "sideCards_pk" PRIMARY KEY ("sideCardId")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "deckLists" ADD CONSTRAINT "deckLists_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");
ALTER TABLE "deckLists" ADD CONSTRAINT "deckLists_fk1" FOREIGN KEY ("formatId") REFERENCES "formats"("formatId");
ALTER TABLE "cards"     ADD CONSTRAINT "cards_fk0" FOREIGN KEY ("deckId") REFERENCES "deckLists"("deckId");
ALTER TABLE "sideNotes" ADD CONSTRAINT "sideNotes_fk0" FOREIGN KEY ("deckId") REFERENCES "deckLists"("deckId");
ALTER TABLE "sideNotes" ADD CONSTRAINT "sideNotes_fk1" FOREIGN KEY ("noteId") REFERENCES "cards"("cardId");
ALTER TABLE "sideCards" ADD CONSTRAINT "sideCards_fk0" FOREIGN KEY ("cardId") REFERENCES "cards"("cardId");
ALTER TABLE "sideCards" ADD CONSTRAINT "sideCards_fk1" FOREIGN KEY ("noteId") REFERENCES "sideNotes"("noteId");
