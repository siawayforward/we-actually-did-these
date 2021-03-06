PGDMP     2                     z            wingspan_game    14.2    14.1 -                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    16394    wingspan_game    DATABASE     q   CREATE DATABASE wingspan_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE wingspan_game;
                postgres    false            ?            1259    16397    bird    TABLE     ?   CREATE TABLE public.bird (
    id integer NOT NULL,
    card_id integer NOT NULL,
    power_move character varying,
    card bytea,
    wingspan double precision,
    speed double precision,
    main_food integer,
    final_habitat smallint NOT NULL
);
    DROP TABLE public.bird;
       public         heap    postgres    false            $           0    0 
   TABLE bird    COMMENT     B   COMMENT ON TABLE public.bird IS 'Table to store bird attributes';
          public          postgres    false    210            ?            1259    16396    bird_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.bird_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.bird_id_seq;
       public          postgres    false    210            %           0    0    bird_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.bird_id_seq OWNED BY public.bird.id;
          public          postgres    false    209            ?            1259    16430 
   card_asset    TABLE     E  CREATE TABLE public.card_asset (
    id integer NOT NULL,
    filename character varying NOT NULL,
    file_size double precision NOT NULL,
    encrypt_code character varying NOT NULL,
    length double precision NOT NULL,
    width double precision NOT NULL,
    date_updated date NOT NULL,
    is_bonus boolean NOT NULL
);
    DROP TABLE public.card_asset;
       public         heap    postgres    false            ?            1259    16429    card_asset_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.card_asset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.card_asset_id_seq;
       public          postgres    false    217            &           0    0    card_asset_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.card_asset_id_seq OWNED BY public.card_asset.id;
          public          postgres    false    216            ?            1259    16417    egg    TABLE     ]   CREATE TABLE public.egg (
    color character(1) NOT NULL,
    egg_value integer NOT NULL
);
    DROP TABLE public.egg;
       public         heap    postgres    false            ?            1259    16423 
   food_token    TABLE     ~   CREATE TABLE public.food_token (
    id integer NOT NULL,
    name character(1) NOT NULL,
    token_value integer NOT NULL
);
    DROP TABLE public.food_token;
       public         heap    postgres    false            ?            1259    16422    food_token_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.food_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.food_token_id_seq;
       public          postgres    false    215            '           0    0    food_token_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.food_token_id_seq OWNED BY public.food_token.id;
          public          postgres    false    214            ?            1259    16406    habitat    TABLE     Z   CREATE TABLE public.habitat (
    id smallint NOT NULL,
    name character(1) NOT NULL
);
    DROP TABLE public.habitat;
       public         heap    postgres    false            ?            1259    16405    habitat_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.habitat_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.habitat_id_seq;
       public          postgres    false    212            (           0    0    habitat_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.habitat_id_seq OWNED BY public.habitat.id;
          public          postgres    false    211            ?            1259    16455    player_game    TABLE       CREATE TABLE public.player_game (
    id bigint NOT NULL,
    player_id integer NOT NULL,
    card_id integer NOT NULL,
    round integer[] NOT NULL,
    round_points double precision NOT NULL,
    is_winner boolean NOT NULL,
    egg_color character varying
);
    DROP TABLE public.player_game;
       public         heap    postgres    false            )           0    0    TABLE player_game    COMMENT     d   COMMENT ON TABLE public.player_game IS 'each game including the rounds, points, players, and cost';
          public          postgres    false    221            ?            1259    16454    player_game_id_seq    SEQUENCE     {   CREATE SEQUENCE public.player_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.player_game_id_seq;
       public          postgres    false    221            *           0    0    player_game_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.player_game_id_seq OWNED BY public.player_game.id;
          public          postgres    false    220            ?            1259    16439    user    TABLE     ?   CREATE TABLE public."user" (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    player_since date NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            +           0    0    TABLE "user"    COMMENT     <   COMMENT ON TABLE public."user" IS 'the player of the game';
          public          postgres    false    219            ?            1259    16438    user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    219            ,           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    218            y           2604    16400    bird id    DEFAULT     b   ALTER TABLE ONLY public.bird ALTER COLUMN id SET DEFAULT nextval('public.bird_id_seq'::regclass);
 6   ALTER TABLE public.bird ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            |           2604    16433    card_asset id    DEFAULT     n   ALTER TABLE ONLY public.card_asset ALTER COLUMN id SET DEFAULT nextval('public.card_asset_id_seq'::regclass);
 <   ALTER TABLE public.card_asset ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            {           2604    16426    food_token id    DEFAULT     n   ALTER TABLE ONLY public.food_token ALTER COLUMN id SET DEFAULT nextval('public.food_token_id_seq'::regclass);
 <   ALTER TABLE public.food_token ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            z           2604    16409 
   habitat id    DEFAULT     h   ALTER TABLE ONLY public.habitat ALTER COLUMN id SET DEFAULT nextval('public.habitat_id_seq'::regclass);
 9   ALTER TABLE public.habitat ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            ~           2604    16458    player_game id    DEFAULT     p   ALTER TABLE ONLY public.player_game ALTER COLUMN id SET DEFAULT nextval('public.player_game_id_seq'::regclass);
 =   ALTER TABLE public.player_game ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            }           2604    16442    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            ?           2606    16404    bird bird_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT bird_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.bird DROP CONSTRAINT bird_pkey;
       public            postgres    false    210            ?           2606    16437    card_asset card_asset_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.card_asset
    ADD CONSTRAINT card_asset_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.card_asset DROP CONSTRAINT card_asset_pkey;
       public            postgres    false    217            ?           2606    16421    egg egg_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.egg
    ADD CONSTRAINT egg_pkey PRIMARY KEY (color);
 6   ALTER TABLE ONLY public.egg DROP CONSTRAINT egg_pkey;
       public            postgres    false    213            ?           2606    16428    food_token food_token_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.food_token
    ADD CONSTRAINT food_token_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.food_token DROP CONSTRAINT food_token_pkey;
       public            postgres    false    215            ?           2606    16411    habitat habitat_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.habitat
    ADD CONSTRAINT habitat_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.habitat DROP CONSTRAINT habitat_pkey;
       public            postgres    false    212            ?           2606    16462    player_game player_game_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.player_game
    ADD CONSTRAINT player_game_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.player_game DROP CONSTRAINT player_game_pkey;
       public            postgres    false    221            ?           2606    16446    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    219            ?           2606    16468    player_game card    FK CONSTRAINT     t   ALTER TABLE ONLY public.player_game
    ADD CONSTRAINT card FOREIGN KEY (card_id) REFERENCES public.card_asset(id);
 :   ALTER TABLE ONLY public.player_game DROP CONSTRAINT card;
       public          postgres    false    3208    221    217            ?           2606    16506    bird card_attributes    FK CONSTRAINT     ?   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT card_attributes FOREIGN KEY (card_id) REFERENCES public.card_asset(id) NOT VALID;
 >   ALTER TABLE ONLY public.bird DROP CONSTRAINT card_attributes;
       public          postgres    false    210    3208    217            ?           2606    16473    player_game eggs    FK CONSTRAINT     r   ALTER TABLE ONLY public.player_game
    ADD CONSTRAINT eggs FOREIGN KEY (egg_color) REFERENCES public.egg(color);
 :   ALTER TABLE ONLY public.player_game DROP CONSTRAINT eggs;
       public          postgres    false    221    213    3204            ?           2606    16490    bird final_habitat    FK CONSTRAINT     ?   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT final_habitat FOREIGN KEY (final_habitat) REFERENCES public.habitat(id) NOT VALID;
 <   ALTER TABLE ONLY public.bird DROP CONSTRAINT final_habitat;
       public          postgres    false    3202    210    212            ?           2606    16501    bird main_food    FK CONSTRAINT     ~   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT main_food FOREIGN KEY (main_food) REFERENCES public.food_token(id) NOT VALID;
 8   ALTER TABLE ONLY public.bird DROP CONSTRAINT main_food;
       public          postgres    false    3206    215    210            ?           2606    16463    player_game player    FK CONSTRAINT     t   ALTER TABLE ONLY public.player_game
    ADD CONSTRAINT player FOREIGN KEY (player_id) REFERENCES public."user"(id);
 <   ALTER TABLE ONLY public.player_game DROP CONSTRAINT player;
       public          postgres    false    219    221    3210           