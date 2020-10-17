using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace BeerAPI.Models
{
    public class Volume
    {
        [JsonPropertyName("value")]
        public decimal? Value { get; set; }

        [JsonPropertyName("unit")]
        public string Unit { get; set; }
    }

    public class BoilVolume
    {
        [JsonPropertyName("value")]
        public decimal? Value { get; set; }

        [JsonPropertyName("unit")]
        public string Unit { get; set; }
    }

    public class Temp
    {
        [JsonPropertyName("value")]
        public decimal? Value { get; set; }

        [JsonPropertyName("unit")]
        public string Unit { get; set; }
    }

    public class MashTemp
    {
        [JsonPropertyName("temp")]
        public Temp Temp { get; set; }

        [JsonPropertyName("duration")]
        public decimal? Duration { get; set; }
    }

    public class Temp2
    {
        [JsonPropertyName("value")]
        public decimal? Value { get; set; }

        [JsonPropertyName("unit")]
        public string Unit { get; set; }
    }

    public class Fermentation
    {
        [JsonPropertyName("temp")]
        public Temp2 Temp { get; set; }
    }

    public class Method
    {
        [JsonPropertyName("mash_temp")]
        public List<MashTemp> MashTemp { get; set; }

        [JsonPropertyName("fermentation")]
        public Fermentation Fermentation { get; set; }

        [JsonPropertyName("twist")]
        public string Twist { get; set; }
    }

    public class Amount
    {
        [JsonPropertyName("value")]
        public decimal Value { get; set; }

        [JsonPropertyName("unit")]
        public string Unit { get; set; }
    }

    public class Malt
    {
        [JsonPropertyName("name")]
        public string Name { get; set; }

        [JsonPropertyName("amount")]
        public Amount Amount { get; set; }
    }

    public class Amount2
    {
        [JsonPropertyName("value")]
        public decimal Value { get; set; }

        [JsonPropertyName("unit")]
        public string Unit { get; set; }
    }

    public class Hop
    {
        [JsonPropertyName("name")]
        public string Name { get; set; }

        [JsonPropertyName("amount")]
        public Amount2 Amount { get; set; }

        [JsonPropertyName("add")]
        public string Add { get; set; }

        [JsonPropertyName("attribute")]
        public string Attribute { get; set; }
    }

    public class Ingredients
    {
        [JsonPropertyName("malt")]
        public List<Malt> Malt { get; set; }

        [JsonPropertyName("hops")]
        public List<Hop> Hops { get; set; }

        [JsonPropertyName("yeast")]
        public string Yeast { get; set; }
    }

    public class Beer
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("name")]
        public string Name { get; set; }

        [JsonPropertyName("tagline")]
        public string Tagline { get; set; }

        [JsonPropertyName("first_brewed")]
        public string FirstBrewed { get; set; }

        [JsonPropertyName("description")]
        public string Description { get; set; }

        [JsonPropertyName("image_url")]
        public string ImageUrl { get; set; }

        [JsonPropertyName("abv")]
        public decimal? Abv { get; set; }

        [JsonPropertyName("ibu")]
        public decimal? Ibu { get; set; }

        [JsonPropertyName("target_fg")]
        public decimal? TargetFg { get; set; }

        [JsonPropertyName("target_og")]
        public decimal? TargetOg { get; set; }

        [JsonPropertyName("ebc")]
        public decimal? Ebc { get; set; }

        [JsonPropertyName("srm")]
        public decimal? Srm { get; set; }

        [JsonPropertyName("ph")]
        public decimal? Ph { get; set; }

        [JsonPropertyName("attenuation_level")]
        public decimal? AttenuationLevel { get; set; }

        [JsonPropertyName("volume")]
        public Volume Volume { get; set; }

        [JsonPropertyName("boil_volume")]
        public BoilVolume BoilVolume { get; set; }

        [JsonPropertyName("method")]
        public Method Method { get; set; }

        [JsonPropertyName("ingredients")]
        public Ingredients Ingredients { get; set; }

        [JsonPropertyName("food_pairing")]
        public List<string> FoodPairing { get; set; }

        [JsonPropertyName("brewers_tips")]
        public string BrewersTips { get; set; }

        [JsonPropertyName("contributed_by")]
        public string ContributedBy { get; set; }
    }

    public class Beers
    {
        [JsonPropertyName("beers")]
        public List<Beer> ListBeers { get; set; }
    }

    #region Error

    public class Data
    {
        [JsonPropertyName("location")]
        public string Location { get; set; }

        [JsonPropertyName("param")]
        public string Param { get; set; }

        [JsonPropertyName("msg")]
        public string Msg { get; set; }

        [JsonPropertyName("value")]
        public string Value { get; set; }
    }

    public class ErrorApi
    {
        [JsonPropertyName("statusCode")]
        public int StatusCode { get; set; }

        [JsonPropertyName("error")]
        public string Error { get; set; }

        [JsonPropertyName("message")]
        public string Message { get; set; }

        [JsonPropertyName("data")]
        public List<Data> Data { get; set; }
    }

    #endregion Error
}
