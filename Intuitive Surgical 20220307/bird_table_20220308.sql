PGDMP         #                z            wingspan_game    14.2    14.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    wingspan_game    DATABASE     q   CREATE DATABASE wingspan_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
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
       public         heap    postgres    false            	           0    0 
   TABLE bird    COMMENT     B   COMMENT ON TABLE public.bird IS 'Table to store bird attributes';
          public          postgres    false    210            ?            1259    16396    bird_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.bird_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.bird_id_seq;
       public          postgres    false    210            
           0    0    bird_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.bird_id_seq OWNED BY public.bird.id;
          public          postgres    false    209            r           2604    16400    bird id    DEFAULT     b   ALTER TABLE ONLY public.bird ALTER COLUMN id SET DEFAULT nextval('public.bird_id_seq'::regclass);
 6   ALTER TABLE public.bird ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            t           2606    16404    bird bird_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT bird_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.bird DROP CONSTRAINT bird_pkey;
       public            postgres    false    210            w           2606    16506    bird card_attributes    FK CONSTRAINT     ?   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT card_attributes FOREIGN KEY (card_id) REFERENCES public.card_asset(id) NOT VALID;
 >   ALTER TABLE ONLY public.bird DROP CONSTRAINT card_attributes;
       public          postgres    false    210            u           2606    16490    bird final_habitat    FK CONSTRAINT     ?   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT final_habitat FOREIGN KEY (final_habitat) REFERENCES public.habitat(id) NOT VALID;
 <   ALTER TABLE ONLY public.bird DROP CONSTRAINT final_habitat;
       public          postgres    false    210            v           2606    16501    bird main_food    FK CONSTRAINT     ~   ALTER TABLE ONLY public.bird
    ADD CONSTRAINT main_food FOREIGN KEY (main_food) REFERENCES public.food_token(id) NOT VALID;
 8   ALTER TABLE ONLY public.bird DROP CONSTRAINT main_food;
       public          postgres    false    210           